import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_info_item/classify_widget.dart';
import 'package:uptodo/stores/task_models_store.dart';
import 'package:uptodo/widgets/round_check_box_widget.dart';

import 'priority_widget.dart';

class TaskInfoItemWidget extends StatefulWidget {
  final TaskModel taskModel;
  final Function(TaskModel) itemOnClick;
  const TaskInfoItemWidget(this.taskModel, this.itemOnClick, {super.key});

  @override
  State<TaskInfoItemWidget> createState() => _TaskInfoItemWidgetState();
}

class _TaskInfoItemWidgetState extends State<TaskInfoItemWidget> {
  var checkedStatus = false;

  @override
  void initState() {
    checkedStatus = widget.taskModel.finished ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.itemOnClick(widget.taskModel);
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 16),
        color: Theme.of(context).cardColor,
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
      ),
    );
  }

  Widget buildCheckBox() {
    return RoundCheckBoxWidget(
      checkedStatus,
      (checkedStatusNew) {
        debugPrint('checkedStatusNew : $checkedStatusNew');
        setState(() {
          checkedStatus = checkedStatusNew;
        });
        widget.taskModel.finished = checkedStatusNew;
        GetIt.I<TaskModelsStore>().updateTaskModel(widget.taskModel);
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

  //TODO: 完善日期显示格式
  String dateTimeFormatter(DateTime dateTime) {
    var dateTimeString = '';
    dateTimeString += '${dateTime.month}/${dateTime.day}';
    dateTimeString += ' ${dateTime.hour}:${dateTime.minute}';

    return dateTimeString;
  }

  Widget buildTaskTime() {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        dateTimeFormatter(widget.taskModel.dateTime),
        style: const TextStyle(color: Color(0xffafafaf), fontSize: 14),
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
