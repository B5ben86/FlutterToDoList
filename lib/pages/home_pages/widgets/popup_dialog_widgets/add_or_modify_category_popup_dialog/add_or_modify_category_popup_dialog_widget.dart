import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/category_model/category_model.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/add_or_modify_category_popup_dialog/items/color_select_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/add_or_modify_category_popup_dialog/items/icon_select_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/popup_common_widgets/build_popup_dialog_input_text_field_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/popup_common_widgets/popup_dialog_bottom_buttons_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/toast_widgets/notice_popup_toast/notice_toast.dart';
import 'package:uptodo/providers/category_model_map_change_notifier.dart';
import 'package:uptodo/widgets/empty_divider_widget.dart';

enum CategoryPopupDialogType {
  add,
  edit,
}

void showAddOrModifyCategoryPopupDialogWidget(
    BuildContext context,
    CategoryModel? modelToEdit,
    Function() confirmButtonPressed,
    Function() cancelOrDeleteButtonPressed) {
  showDialog(
    context: context,
    builder: (context) {
      var dialogType = modelToEdit == null
          ? CategoryPopupDialogType.add
          : CategoryPopupDialogType.edit;
      var confirmButtonText = dialogType == CategoryPopupDialogType.add
          ? S.current.add_category_popup_dialog_confirm_button_text
          : S.current.add_category_popup_dialog_modify_button_text;
      var leftButtonText = dialogType == CategoryPopupDialogType.add
          ? S.current.common_cancel
          : S.current.add_category_popup_dialog_delete_button_text;
      var selectedColorIndex = 0;
      var selectedIconIndex = 0;
      var categoryName = '';
      var textEditingController =
          TextEditingController.fromValue(TextEditingValue(text: categoryName));

      if (modelToEdit == null) {
        modelToEdit = CategoryModel('', 0, 0);
      } else {
        selectedColorIndex = modelToEdit!.colorNum;
        selectedIconIndex = modelToEdit!.iconNum;
        categoryName = modelToEdit!.name;
      }
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.only(left: 8, right: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 16, bottom: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(),
                    buildEmptyDivider(20),
                    _buildItemTitle(
                        S.current.add_category_popup_dialog_name_title),
                    buildEmptyDivider(16),
                    buildPopupDialogInputTextFieldWidget(
                      S.current
                          .add_category_popup_dialog_name_textfield_placeholder,
                      true,
                      textEditingController,
                    ),
                    buildEmptyDivider(16),
                    _buildItemTitle(
                        S.current.add_category_popup_dialog_icon_title),
                    buildEmptyDivider(8),
                    IconSelectWidget(
                      selectedIconIndex,
                      selectedColorIndex,
                      ((iconNum) {
                        selectedIconIndex = iconNum;
                      }),
                    ),
                    buildEmptyDivider(16),
                    _buildItemTitle(
                        S.current.add_category_popup_dialog_color_title),
                    buildEmptyDivider(8),
                    ColorSelectWidget(((colorNum) {
                      setState(
                        () {
                          selectedColorIndex = colorNum;
                        },
                      );
                    })),
                    const Spacer(),
                    buildDialogBottomButtonsWidget(
                      leftButtonText,
                      confirmButtonText,
                      (() {
                        if (dialogType == CategoryPopupDialogType.add) {
                        } else {
                          context
                              .read<CategoryModelMapChangeNotifier>()
                              .deleteModel(modelToEdit!.id);
                          // GetIt.I<CategoryModelsStore>()
                          //     .deleteModel(modelToEdit!.id);
                        }
                        cancelOrDeleteButtonPressed();
                        Navigator.pop(context);
                      }),
                      (() {
                        categoryName = textEditingController.text;
                        if (categoryName.isNotEmpty) {
                          if (categoryName.length > 6) {
                            noticeToast(S.current
                                .add_category_popup_dialog_warning_name_too_long);
                          } else {
                            if (dialogType == CategoryPopupDialogType.add) {
                              CategoryModel categoryModelNew = CategoryModel(
                                  categoryName,
                                  selectedColorIndex,
                                  selectedIconIndex);
                              context
                                  .read<CategoryModelMapChangeNotifier>()
                                  .insertModel(categoryModelNew);
                              // GetIt.I<CategoryModelsStore>()
                              //     .insertModel(categoryModelNew);
                              confirmButtonPressed();
                            } else {
                              modelToEdit?.name = categoryName;
                              modelToEdit?.colorNum = selectedColorIndex;
                              modelToEdit?.iconNum = selectedIconIndex;
                              context
                                  .read<CategoryModelMapChangeNotifier>()
                                  .updateModel(modelToEdit!);
                              // GetIt.I<CategoryModelsStore>()
                              //     .updateModel(modelToEdit!);
                              confirmButtonPressed();
                            }
                            Navigator.pop(context);
                          }
                        } else {
                          noticeToast(S.current
                              .add_category_popup_dialog_name_textfield_placeholder);
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildTitle() {
  return Text(
    S.current.add_category_popup_dialog_title,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _buildItemTitle(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
    ),
  );
}
