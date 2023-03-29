import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_classify_header_section/task_classify_header_section_widget.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_info_item/task_info_item_widget.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/task_edit_page.dart';
import 'package:uptodo/providers/task_model_map_change_notifier.dart';
import 'package:uptodo/utility/tools/navigate_handler.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (context) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return _buildListItem(context, index);
            },
            itemCount: context.select(
                (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                    taskModelMapChangeNotifier.length + 1),
          );
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    // debugPrint('list item build : $index');
    if (index == 0) {
      //TODO: 如何更优雅处理 headerSection
      return const TaskClassifyHeaderSectionWidget(EHeaderSectionType.today);
    } else {
      return Builder(builder: (context) {
        var taskModelList =
            context.read<TaskModelMapChangeNotifier>().taskModelList;
        var taskModel = taskModelList[index - 1]!;
        return TaskInfoItemWidget(taskModel, (taskModel) {
          NavigateHandler().push(context, TaskEditPage(taskModel));
        });
      });
    }
  }
}
