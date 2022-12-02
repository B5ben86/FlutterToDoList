import 'package:flutter/material.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_info_item/classify_widget.dart';
import 'package:uptodo/widgets/round_check_box_widget.dart';

import 'priority_widget.dart';

class TaskInfoItemWidget extends StatefulWidget {
  final TaskModel taskModel;
  const TaskInfoItemWidget(this.taskModel, {super.key});

  @override
  State<TaskInfoItemWidget> createState() => _TaskInfoItemWidgetState();
}

class _TaskInfoItemWidgetState extends State<TaskInfoItemWidget> {
  bool checkedStatus = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      color: const Color(0xFF363636),
      child: SizedBox(
        height: 72,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 5,
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCheckBox(),
              buildRightWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckBox() {
    return RoundCheckBoxWidget(
      checkedStatus,
      (checkedStatusNew) {
        setState(() {
          checkedStatus = !checkedStatus;
        });
      },
    );
  }

  Widget buildRightWidget() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTaskName(),
          const Spacer(),
          buildBottomWidget(),
        ],
      ),
    );
  }

  Widget buildBottomWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTaskTime(),
        const Spacer(),
        buildClassifyAndPriorityWidget(),
      ],
    );
  }

  Widget buildClassifyAndPriorityWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ClassifyWidget(widget.taskModel.categoryModel),
        const SizedBox(
          width: 12,
        ),
        PriorityWidget(widget.taskModel.priority, () {
          debugPrint('Priority Widget Pressed');
        }),
      ],
    );
  }

  Widget buildTaskTime() {
    return const Padding(
      padding: EdgeInsets.only(top: 6),
      child: Text(
        'Today At 16:45',
        style: TextStyle(color: Color(0xffafafaf), fontSize: 14),
      ),
    );
  }

  Widget buildTaskName() {
    return Text(
      widget.taskModel.taskName,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
