import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_classify_header_section/task_classify_header_section_widget.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_classify_header_section/task_classify_sliver_header_delegate.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_info_item/task_info_item_widget.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/task_edit_page.dart';
import 'package:uptodo/providers/task_model_map_change_notifier.dart';
import 'package:uptodo/utility/tools/navigate_handler.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: TaskClassifySliverHeaderDelegate(
                headerSectionType: EHeaderSectionType.today),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var taskModelList =
                    context.read<TaskModelMapChangeNotifier>().todoTaskModeList;
                return _buildListItem(context, index, taskModelList);
              },
              childCount: context.select(
                  (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                      taskModelMapChangeNotifier.todoTaskModeList.length),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: TaskClassifySliverHeaderDelegate(
                headerSectionType: EHeaderSectionType.completed),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var taskModelList = context
                    .read<TaskModelMapChangeNotifier>()
                    .completedTaskModelList;
                return _buildListItem(context, index, taskModelList);
              },
              childCount: context.select(
                  (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                      taskModelMapChangeNotifier.completedTaskModelList.length),
            ),
          ),
        ],
      ),
    );
    // return Expanded(
    //   child: Observer(
    //     builder: (context) {
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //           return _buildListItem(context, index);
    //         },
    //         itemCount: context.select(
    //             (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
    //                 taskModelMapChangeNotifier.length + 1),
    //       );
    //     },
    //   ),
    // );
  }

  Widget _buildListItem(
      BuildContext context, int index, List<TaskModel> taskModelList) {
    debugPrint('sliver list item build : $index');
    return Builder(builder: (context) {
      var taskModel = taskModelList[index];
      return TaskInfoItemWidget(taskModel, (taskModel) {
        NavigateHandler().push(context, TaskEditPage(taskModel));
      });
    });
  }
}
