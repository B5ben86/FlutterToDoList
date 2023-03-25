import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/widgets/categary_icon_lib_widget.dart';

enum ETaskEditItemType {
  time,
  category,
  priority,
  subTask,
  delete,
}

class TaskOtherEditItemWidget extends StatefulWidget {
  final TaskModel taskModel;
  final ETaskEditItemType itemType;
  final Function(ETaskEditItemType itemType) buttonOnPressed;
  const TaskOtherEditItemWidget(
      this.taskModel, this.itemType, this.buttonOnPressed,
      {super.key});

  @override
  State<TaskOtherEditItemWidget> createState() =>
      _TaskTimeEditItemWidgetState();
}

class _TaskTimeEditItemWidgetState extends State<TaskOtherEditItemWidget> {
  late IconData icon;
  late String itemTitle;

  @override
  void initState() {
    switch (widget.itemType) {
      case ETaskEditItemType.time:
        itemTitle = S.current.edit_task_page_item_title_task_time;
        icon = Icons.timer_outlined;
        break;
      case ETaskEditItemType.category:
        itemTitle = S.current.edit_task_page_item_title_task_category;
        icon = Icons.tag_outlined;
        break;
      case ETaskEditItemType.priority:
        itemTitle = S.current.edit_task_page_item_title_task_priority;
        icon = Icons.flag_outlined;
        break;
      case ETaskEditItemType.subTask:
        itemTitle = S.current.edit_task_page_item_title_sub_task;
        icon = Icons.subtitles_outlined;
        break;
      case ETaskEditItemType.delete:
        itemTitle = S.current.edit_task_page_item_title_delete_task;
        icon = Icons.delete_outline;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color itemColor = Colors.white;

    if (widget.itemType == ETaskEditItemType.delete) {
      itemColor = Colors.redAccent;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: itemColor,
              ),
              const SizedBox(width: 8),
              Text(
                itemTitle,
                style: TextStyle(
                  fontSize: 16,
                  color: itemColor,
                ),
              ),
            ],
          ),
          rightButtonWidget(),
        ],
      ),
    );
  }

  Widget rightButtonWidget() {
    late Widget rightButtonWidget;
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0x15ffffff),
      shadowColor: Colors.transparent,
      fixedSize: const Size.fromHeight(45),
      padding: const EdgeInsets.only(left: 16, right: 16),
    );

    switch (widget.itemType) {
      case ETaskEditItemType.time:
        rightButtonWidget = ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            widget.buttonOnPressed(widget.itemType);
          },
          child: Text(widget.taskModel.dateTimeFormatter()),
        );
        break;
      case ETaskEditItemType.category:
        rightButtonWidget = ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            widget.buttonOnPressed(widget.itemType);
          },
          child: Row(
            children: [
              Icon(
                CategoryIconLibWidget().getIconDataViaIconIndex(
                    widget.taskModel.categoryModel.iconNum),
                color: CategoryIconLibWidget().getIconColorViaColorIndex(
                    widget.taskModel.categoryModel.colorNum)[0],
              ),
              const SizedBox(
                width: 10,
              ),
              Text(widget.taskModel.categoryModel.name),
            ],
          ),
        );
        break;
      case ETaskEditItemType.priority:
        rightButtonWidget = ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            widget.buttonOnPressed(widget.itemType);
          },
          child: Text(widget.taskModel.priority.toString()),
        );
        break;
      case ETaskEditItemType.subTask:
        rightButtonWidget = ElevatedButton(
          style: buttonStyle,
          onPressed: () {
            widget.buttonOnPressed(widget.itemType);
          },
          child: const Text('Add'),
        );
        break;
      case ETaskEditItemType.delete:
        rightButtonWidget = const SizedBox();
        break;
    }
    return rightButtonWidget;
  }
}
