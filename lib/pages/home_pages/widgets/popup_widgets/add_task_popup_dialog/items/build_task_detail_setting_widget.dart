import 'package:flutter/material.dart';

Widget buildTaskDetailSettingWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      _buildLeftItems(),
      _buildRightItem(context),
    ],
  );
}

Widget _buildLeftItems() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 0),
          onPressed: () {},
          icon: const Icon(
            Icons.timer_outlined,
            size: 24,
          )),
      IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 0),
          onPressed: () {},
          icon: const Icon(
            Icons.tag_outlined,
            size: 24,
          )),
      IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 0),
          onPressed: () {},
          icon: const Icon(
            Icons.flag_outlined,
            size: 24,
          )),
    ],
  );
}

Widget _buildRightItem(BuildContext context) {
  return IconButton(
    padding: const EdgeInsets.only(right: 0),
    alignment: Alignment.centerRight,
    onPressed: () {},
    icon: Icon(
      Icons.send_outlined,
      size: 24,
      color: Theme.of(context).primaryColor,
    ),
  );
}
