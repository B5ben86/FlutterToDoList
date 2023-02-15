import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/category_model/category_model.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/add_or_modify_category_popup_dialog/add_or_modify_category_popup_dialog_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/choose_category_popup_dialog/items/category_item_widget.dart';
import 'package:uptodo/stores/category_models_store.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

void showChooseCategoryPopupDialogWidget(BuildContext context,
    Function(CategoryModel categoryModel) categorySelected) {
  showDialog(
    context: context,
    builder: (context) {
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
              height: 450,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTitle(),
                  CategoryGridViewWidget((onSelectedCategory) => {
                        categorySelected(onSelectedCategory),
                        Navigator.pop(context),
                      }),
                  _buildAddButton(() => {
                        showAddOrModifyCategoryPopupDialogWidget(
                            context, null, () => {}, () => {})
                      }),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildTitle() {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        S.current.choose_category_popup_dialog_title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Divider(
        thickness: 1,
        color: Color(0xff979797),
        indent: 8,
        endIndent: 8,
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget _buildAddButton(Function() onPressed) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: themeContext().primaryColor,
        minimumSize: const Size.fromHeight(48),
        textStyle: const TextStyle(fontSize: 16),
      ),
      onPressed: onPressed,
      child: Text(
        S.current.choose_category_popup_dialog_add_button_text,
      ),
    ),
  );
}

class CategoryGridViewWidget extends StatefulWidget {
  final Function(CategoryModel) onSelected;
  const CategoryGridViewWidget(this.onSelected, {super.key});

  @override
  State<CategoryGridViewWidget> createState() => _CategoryGridViewWidgetState();
}

class _CategoryGridViewWidgetState extends State<CategoryGridViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (context) {
          return GridView.builder(
            padding: const EdgeInsets.only(left: 12, right: 12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 90,
                childAspectRatio: 64 / 90,
                mainAxisSpacing: 16,
                crossAxisSpacing: 30),
            itemCount: GetIt.I<CategoryModelsStore>().modelMap.length,
            itemBuilder: ((context, index) {
              var categoryModel = GetIt.I<CategoryModelsStore>()
                  .modelMap
                  .values
                  .toList()[index];
              return CategoryItemWidget(categoryModel, (() {
                widget.onSelected(categoryModel);
              }));
            }),
          );
        },
      ),
    );
  }
}
