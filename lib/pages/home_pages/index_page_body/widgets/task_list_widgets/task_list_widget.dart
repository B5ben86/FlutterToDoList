import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_classify_header_section/task_classify_header_section_widget.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_info_item/task_info_item_widget.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/task_edit_page.dart';
import 'package:uptodo/stores/task_models_store.dart';
import 'package:uptodo/utility/tools/NavigateHandler.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (context) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return const TaskClassifyHeaderSectionWidget(
                    EHeaderSectionType.today);
              } else {
                var taskModel = GetIt.I<TaskModelsStore>()
                    .taskModelMap
                    .values
                    .toList()[index];
                return TaskInfoItemWidget(taskModel, (taskModel) {
                  NavigateHandler().push(context, TaskEditPage(taskModel));
                });
              }
            },
            itemCount: GetIt.I<TaskModelsStore>().taskModelMap.length,
          );
        },
      ),
    );
  }
}
