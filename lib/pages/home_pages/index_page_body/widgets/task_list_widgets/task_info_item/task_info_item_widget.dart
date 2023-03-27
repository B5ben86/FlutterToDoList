import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_info_item/classify_widget.dart';
import 'package:uptodo/providers/task_model_map_change_notifier.dart';
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
  // var checkedStatus = false;

  @override
  void initState() {
    // checkedStatus = widget.taskModel.finished ?? false;
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
    debugPrint('build checkbox: ${widget.taskModel.id}');
    var finishedRaw = context.select(
            (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                taskModelMapChangeNotifier
                    .taskModelMap[widget.taskModel.id]?.finished) ??
        false;
    return RoundCheckBoxWidget(
      finishedRaw,
      (checkedStatusNew) {
        // debugPrint(
        //     'checkedStatusNew update : ${widget.taskModel.id} $checkedStatusNew');
        widget.taskModel.finished = checkedStatusNew;
        // GetIt.I<TaskModelsStore>().updateTaskModel(widget.taskModel);
        context
            .read<TaskModelMapChangeNotifier>()
            .updateTaskModel(widget.taskModel);
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
    debugPrint('build classify and priority widget: ${widget.taskModel.id}');

    var categoryModel = context.select(
      (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
          taskModelMapChangeNotifier
              .taskModelMap[widget.taskModel.id]!.categoryModel,
    );
    var priority = context.select(
      (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
          taskModelMapChangeNotifier
              .taskModelMap[widget.taskModel.id]!.priority,
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ClassifyWidget(categoryModel),
        const SizedBox(
          width: 12,
        ),
        PriorityWidget(priority, () {
          debugPrint('Priority Widget Pressed');
        }),
      ],
    );
  }

  Widget buildTaskTime() {
    debugPrint('build taskTime: ${widget.taskModel.id}');
    var dateTime = context.select(
        (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
            taskModelMapChangeNotifier
                .taskModelMap[widget.taskModel.id]?.dateTime);
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        widget.taskModel.dateTimeFormatter(),
        style: const TextStyle(color: Color(0xffafafaf), fontSize: 14),
      ),
    );
  }

  Widget buildTaskName() {
    debugPrint('build taskName: ${widget.taskModel.id}');
    var taskName = context.select(
      (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
          taskModelMapChangeNotifier
              .taskModelMap[widget.taskModel.id]?.taskName ??
          "",
    );
    return Text(
      taskName,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
