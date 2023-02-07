import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_list_widget.dart';
import 'package:uptodo/stores/task_models_store.dart';
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
    return Observer(
      builder: (observerContext) {
        if (GetIt.I<TaskModelsStore>().isEmpty) {
          return const NoTasksWidget();
        } else {
          return buildBodyContent();
        }
      },
    );
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
        const TaskListWidget(),
      ]),
    );
  }

  Widget buildListView() {
    return Expanded(
      child: Observer(
        builder: (context) {
          debugPrint(
              'tasks amount : ${GetIt.I<TaskModelsStore>().taskModelMap.length}');
          return ListView.builder(
            itemBuilder: (context, index) {
              var taskModel = GetIt.I<TaskModelsStore>()
                  .taskModelMap
                  .values
                  .toList()[index];
              return TaskInfoItemWidget(taskModel);
            },
            itemCount: GetIt.I<TaskModelsStore>().taskModelMap.length,
          );
        },
      ),
    );
  }
}
