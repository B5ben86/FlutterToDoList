import 'package:flutter/material.dart';
import 'package:uptodo/widgets/categary_icon_lib_widget.dart';

class ColorSelectWidget extends StatelessWidget {
  final Function(int colorNum) onColorSelected;
  const ColorSelectWidget(this.onColorSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    var colorNumList = CategoryIconLibWidget().categoryIconsColorLib.values;
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorNumList.length,
          itemBuilder: ((context, index) {
            return _buildColorItem(index);
          })),
    );
  }

  Widget _buildColorItem(int colorIndex) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      height: 48,
      width: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: CategoryIconLibWidget()
                .getIconColorViaColorIndex(colorIndex)[0],
            shape: const CircleBorder()),
        onPressed: (() {
          onColorSelected(colorIndex);
        }),
        child: Container(),
      ),
    );
  }
}
