import 'package:flutter/material.dart';
import 'package:uptodo/models/category_model/category_model.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/calendar_popup_dialog/calendar_popup_dialog_widget.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/widgets/task_edit_page_app_bar_widget.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/widgets/task_other_edit_item_widget.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/widgets/task_title_edit_item_widget.dart';

class TaskEditPage extends StatefulWidget {
  final TaskModel taskModel;
  const TaskEditPage(this.taskModel, {super.key});

  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  late TaskModel taskModelNew;

  @override
  void initState() {
    taskModelNew = TaskModel(
        widget.taskModel.taskName,
        widget.taskModel.taskDescription,
        widget.taskModel.dateTime,
        widget.taskModel.priority,
        CategoryModel(
            widget.taskModel.categoryModel.name,
            widget.taskModel.categoryModel.colorNum,
            widget.taskModel.categoryModel.iconNum),
        widget.taskModel.finished);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskEditPageAppBarWidget(
        () {
          debugPrint('close button');
          Navigator.pop(context);
        },
        () {
          debugPrint('refresh button');
        },
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTaskNameAndDescriptionContent(),
          const SizedBox(height: 34),
          _buildTaskTimeEditItem(),
          const SizedBox(height: 34),
          _buildTaskCategoryEditItem(),
          const SizedBox(height: 34),
          _buildTaskPriorityEditItem(),
          const SizedBox(height: 34),
          _buildTaskSubTaskEditItem(),
          const SizedBox(height: 34),
          _buildTaskDeleteEditItem(),
        ],
      ),
    );
  }

  Widget _buildTaskNameAndDescriptionContent() {
    return TaskTitleEditItemWidget(
      (taskModelNew.finished ?? false),
      taskModelNew.taskName,
      taskModelNew.taskDescription,
      (checkStatusNew) {
        setState(() {
          taskModelNew.finished = checkStatusNew;
        });
      },
      (taskTitleNew, taskDescriptionNew) {
        debugPrint(
            'taskTitleNew = $taskTitleNew;  taskDescriptionNew = $taskDescriptionNew');
        setState(() {
          taskModelNew.taskName = taskTitleNew;
          taskModelNew.taskDescription = taskDescriptionNew;
        });
      },
    );
  }

  Widget _buildTaskTimeEditItem() {
    return TaskOtherEditItemWidget(taskModelNew, ETaskEditItemType.time,
        (itemType) {
      if (itemType == ETaskEditItemType.time) {
        showCalendarPopupDialogWidget(
          context,
          (dateTimeNew) => {
            setState(
              () {
                taskModelNew.dateTime = dateTimeNew;
              },
            )
          },
        );
      }
    });
  }

  Widget _buildTaskCategoryEditItem() {
    return TaskOtherEditItemWidget(
      taskModelNew,
      ETaskEditItemType.category,
      (itemType) => {},
    );
  }

  Widget _buildTaskPriorityEditItem() {
    return TaskOtherEditItemWidget(
      taskModelNew,
      ETaskEditItemType.priority,
      (itemType) => {},
    );
  }

  Widget _buildTaskSubTaskEditItem() {
    return TaskOtherEditItemWidget(
      taskModelNew,
      ETaskEditItemType.subTask,
      (itemType) => {},
    );
  }

  Widget _buildTaskDeleteEditItem() {
    return TaskOtherEditItemWidget(
      taskModelNew,
      ETaskEditItemType.delete,
      (itemType) => {},
    );
  }
}
