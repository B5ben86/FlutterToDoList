import 'package:flutter/material.dart';
import 'package:uptodo/models/category_model/category_model.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/add_or_modify_category_popup_dialog/add_or_modify_category_popup_dialog_widget.dart';
import 'package:uptodo/widgets/categary_icon_lib_widget.dart';

class CategoryItemWidget extends StatefulWidget {
  final CategoryModel categoryModel;
  final Function() onPressed;
  const CategoryItemWidget(this.categoryModel, this.onPressed, {super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  late List<Color> colors;
  late IconData iconData;

  @override
  void initState() {
    colors = CategoryIconLibWidget()
        .getIconColorViaColorIndex(widget.categoryModel.colorNum);
    iconData = CategoryIconLibWidget()
        .getIconDataViaIconIndex(widget.categoryModel.iconNum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: const Color(0xff272727),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: colors[1], backgroundColor: colors[0]),
            onPressed: widget.onPressed,
            onLongPress: () {
              showAddOrModifyCategoryPopupDialogWidget(
                  context,
                  widget.categoryModel,
                  () => {
                        updateStatus(),
                      },
                  () => {});
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.categoryModel.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  void updateStatus() {
    setState(() {
      colors = CategoryIconLibWidget()
          .getIconColorViaColorIndex(widget.categoryModel.colorNum);
      iconData = CategoryIconLibWidget()
          .getIconDataViaIconIndex(widget.categoryModel.iconNum);
    });
  }
}
