import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/task_model/category_model.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/add_category_popup_dialog/items/color_select_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/add_category_popup_dialog/items/icon_select_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/popup_common_widgets/build_popup_dialog_input_text_field_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/popup_common_widgets/popup_dialog_bottom_buttons_widget.dart';
import 'package:uptodo/widgets/empty_divider_widget.dart';

void showAddCategoryPopupDialogWidget(BuildContext context,
    Function(CategoryModel categoryModel) categoryCreated) {
  showDialog(
    context: context,
    builder: (context) {
      var selectedColorIndex = 0;
      var selectedIconIndex = 0;
      var categoryName = '';
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
                      ((onEditChangedText) {
                        categoryName = onEditChangedText;
                      }),
                      ((onSubmittedText) {
                        categoryName = onSubmittedText;
                      }),
                    ),
                    buildEmptyDivider(16),
                    _buildItemTitle(
                        S.current.add_category_popup_dialog_icon_title),
                    buildEmptyDivider(8),
                    IconSelectWidget(
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
                      S.current.common_cancel,
                      S.current.add_category_popup_dialog_confirm_button_text,
                      (() {
                        Navigator.pop(context);
                      }),
                      (() {
                        Navigator.pop(context);
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
