import 'package:flutter/material.dart';
import 'package:uptodo/models/model_handlers/task_models_handler.dart';
import 'package:uptodo/widgets/empty_divider_widget.dart';

import 'widgets/no_tasks_widget.dart';
import 'widgets/search_task_widget.dart';
import 'widgets/task_list_widgets/task_info_item/task_info_item_widget.dart';

class IndexPageBody extends StatefulWidget {
  const IndexPageBody({super.key});

  @override
  State<IndexPageBody> createState() => _IndexPageBodyState();
}

class _IndexPageBodyState extends State<IndexPageBody> {
  @override
  Widget build(BuildContext context) {
    if (TaskModelsHandler().isEmpty()) {
      return const NoTasksWidget();
    } else {
      return buildBodyContent();
    }
  }

  Widget buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: Column(children: [
        SearchTaskWidget(
          (newText) {
            debugPrint('SearchTaskWidget : onEditChanged : $newText');
          },
          ((text) {
            debugPrint('SearchTaskWidget : onSubmitted : $text');
          }),
        ),
        buildEmptyDivider(20),
        buildListView(),
      ]),
    );
  }

  Widget buildListView() {
    var taskModels = TaskModelsHandler().getTaskModelList();
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var taskModel = taskModels[index];
          return TaskInfoItemWidget(taskModel);
        },
        itemCount: TaskModelsHandler().tasksAmount(),
      ),
    );
  }
}
