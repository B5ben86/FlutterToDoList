import 'package:flutter/material.dart';
import 'package:uptodo/models/task_model/category_model.dart';
import 'package:uptodo/widgets/categary_icon_lib_widget.dart';

class ClassifyWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const ClassifyWidget(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.only(left: 8, right: 8),
          backgroundColor: CategoryIconLibWidget()
              .getIconColorViaColorIndex(categoryModel.colorNum)[0],
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                CategoryIconLibWidget()
                    .getIconDataViaIconIndex(categoryModel.iconNum),
                color: CategoryIconLibWidget()
                    .getIconColorViaColorIndex(categoryModel.colorNum)[1],
                size: 14,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  '178',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
