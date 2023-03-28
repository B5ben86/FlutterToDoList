import 'package:flutter/material.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/popup_dialog_widgets/modify_task_title_info_popup_dialog_widget.dart';
import 'package:uptodo/widgets/round_check_box_widget.dart';

class TaskTitleEditItemWidget extends StatefulWidget {
  final bool checkedStatus;
  final String taskTitle;
  final String taskDescription;
  final Function(bool checkStatusNew) checkStatusUpdateCallback;
  final Function(String taskTitleNew, String taskDescriptionNew)
      modifyConfirmCallback;
  const TaskTitleEditItemWidget(
      this.checkedStatus,
      this.taskTitle,
      this.taskDescription,
      this.checkStatusUpdateCallback,
      this.modifyConfirmCallback,
      {super.key});

  @override
  State<TaskTitleEditItemWidget> createState() =>
      _TaskTitleEditItemWidgetState();
}

class _TaskTitleEditItemWidgetState extends State<TaskTitleEditItemWidget> {
  var checkStatusTmp = false;
  var taskTitleTmp = "";
  var taskDescriptionTmp = "";

  @override
  void initState() {
    checkStatusTmp = widget.checkedStatus;
    taskTitleTmp = widget.taskTitle;
    taskDescriptionTmp = widget.taskDescription;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCheckBox(),
            buildTaskBaseInfo(),
            const Spacer(),
            IconButton(
              onPressed: () {
                showModifyTaskTitleInfoPopupDialogWidget(
                  context,
                  taskTitleTmp,
                  taskDescriptionTmp,
                  ((taskTitleNew, taskDescriptionNew) {
                    taskTitleTmp = taskTitleNew;
                    taskDescriptionTmp = taskDescriptionNew;
                    widget.modifyConfirmCallback(
                        taskTitleNew, taskDescriptionNew);
                  }),
                );
              },
              icon: const Icon(Icons.edit_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckBox() {
    return RoundCheckBoxWidget(
      checkStatusTmp,
      (checkedStatusNew) {
        setState(() {
          checkStatusTmp = checkedStatusNew;
          widget.checkStatusUpdateCallback(checkedStatusNew);
        });
      },
    );
  }

  Widget buildTaskBaseInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.taskTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            height: 15,
          ),
          Text(
            widget.taskDescription,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFFAFAFAF),
            ),
          ),
        ],
      ),
    );
  }
}
