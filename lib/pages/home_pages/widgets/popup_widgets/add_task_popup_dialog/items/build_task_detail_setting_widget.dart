import 'package:flutter/material.dart';

enum ETaskSettingItemType {
  clock,
  tag,
  priority,
  confirm,
}

Widget buildTaskDetailSettingWidget(
    BuildContext context, Function(ETaskSettingItemType itemType) onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      _buildLeftItems(onPressed),
      _buildRightItem(context, onPressed),
    ],
  );
}

Widget _buildLeftItems(Function(ETaskSettingItemType itemType) onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 0),
          onPressed: () {
            onPressed(ETaskSettingItemType.clock);
          },
          icon: const Icon(
            Icons.timer_outlined,
            size: 24,
          )),
      IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 0),
          onPressed: () {
            onPressed(ETaskSettingItemType.tag);
          },
          icon: const Icon(
            Icons.tag_outlined,
            size: 24,
          )),
      IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 0),
          onPressed: () {
            onPressed(ETaskSettingItemType.priority);
          },
          icon: const Icon(
            Icons.flag_outlined,
            size: 24,
          )),
    ],
  );
}

Widget _buildRightItem(
    BuildContext context, Function(ETaskSettingItemType itemType) onPressed) {
  return IconButton(
    padding: const EdgeInsets.only(right: 0),
    alignment: Alignment.centerRight,
    onPressed: () {
      onPressed(ETaskSettingItemType.confirm);
    },
    icon: Icon(
      Icons.send_outlined,
      size: 24,
      color: Theme.of(context).primaryColor,
    ),
  );
}
