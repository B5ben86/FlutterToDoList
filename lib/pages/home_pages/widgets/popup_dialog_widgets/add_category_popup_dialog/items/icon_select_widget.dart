import 'package:flutter/material.dart';
import 'package:uptodo/widgets/categary_icon_lib_widget.dart';

class IconSelectWidget extends StatefulWidget {
  final int selectedIconColorIndex;
  final Function(int iconNum) onIconSelected;
  const IconSelectWidget(this.selectedIconColorIndex, this.onIconSelected,
      {super.key});

  @override
  State<IconSelectWidget> createState() => _IconSelectWidgetState();
}

class _IconSelectWidgetState extends State<IconSelectWidget> {
  var selectedIconIndex = 0;
  var iconList = CategoryIconLibWidget().categoryIconsLib.values;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Icon(
            color: CategoryIconLibWidget()
                .getIconColorViaColorIndex(widget.selectedIconColorIndex)[0],
            size: 38,
            CategoryIconLibWidget().getIconDataViaIconIndex(selectedIconIndex),
          ),
          _buildVerticalDivider(),
          Expanded(
            child: ListView.builder(
                itemCount: iconList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return _buildIconItem(index);
                })),
          ),
        ],
      ),
    );
  }

  Widget _buildIconItem(int iconIndex) {
    return Container(
        padding: const EdgeInsets.only(right: 12),
        height: 48,
        width: 48,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            CategoryIconLibWidget().getIconDataViaIconIndex(iconIndex),
            size: 32,
          ),
          onPressed: () {
            widget.onIconSelected(iconIndex);
            setState(() {
              selectedIconIndex = iconIndex;
            });
          },
        ));
  }

  Widget _buildVerticalDivider() {
    return const Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: VerticalDivider(
        color: Colors.grey,
        width: 1,
      ),
    );
  }
}
