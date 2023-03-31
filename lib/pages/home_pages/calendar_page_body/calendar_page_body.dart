import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/calendar_page_body/widgets/calendar_select_widget.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/no_tasks_widget.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_classify_header_section/task_classify_header_section_widget.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_classify_header_section/task_classify_sliver_header_delegate.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_info_item/task_info_item_widget.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/task_edit_page.dart';
import 'package:uptodo/providers/task_model_map_change_notifier.dart';
import 'package:uptodo/utility/tools/navigate_handler.dart';

class CalendarPageBody extends StatefulWidget {
  const CalendarPageBody({super.key});

  @override
  State<CalendarPageBody> createState() => CalendarPageBodyState();
}

class CalendarPageBodyState extends State<CalendarPageBody> {
  DateTime selectedDayTmp = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var dateTimeRange =
        context.watch<TaskModelMapChangeNotifier>().taskModelDateTimeRange;

    if (selectedDayTmp.isAfter(dateTimeRange.end)) {
      setState(() {
        selectedDayTmp = dateTimeRange.end;
      });
    } else if (selectedDayTmp.isBefore(dateTimeRange.start)) {
      setState(() {
        selectedDayTmp = dateTimeRange.start;
      });
    }

    return Column(
      children: [
        CalendarSelectWidget(
          selectedDayTmp,
          dateTimeRange,
          (dateTime) => {
            debugPrint('on day selected : $dateTime'),
            setState(() {
              selectedDayTmp = dateTime;
            }),
          },
        ),
        _buildListView(selectedDayTmp),
      ],
    );
  }

  Widget _buildListView(DateTime dateTime) {
    var todoTaskModelList = context
        .read<TaskModelMapChangeNotifier>()
        .taskModelListInOneDay(dateTime, false);
    var completedTaskModelList = context
        .read<TaskModelMapChangeNotifier>()
        .taskModelListInOneDay(dateTime, true);

    var totalLength = context.select(
            (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                taskModelMapChangeNotifier
                    .taskModelListInOneDay(dateTime, false)
                    .length) +
        context.select(
            (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                taskModelMapChangeNotifier
                    .taskModelListInOneDay(dateTime, true)
                    .length);

    if (totalLength == 0) {
      return const NoTasksWidget();
    } else {
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
                  return _buildListItem(context, index, todoTaskModelList);
                },
                childCount: context.select(
                    (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                        taskModelMapChangeNotifier
                            .taskModelListInOneDay(dateTime, false)
                            .length),
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
                  return _buildListItem(context, index, completedTaskModelList);
                },
                childCount: context.select(
                    (TaskModelMapChangeNotifier taskModelMapChangeNotifier) =>
                        taskModelMapChangeNotifier
                            .taskModelListInOneDay(dateTime, true)
                            .length),
              ),
            ),
          ],
        ),
      );
    }
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
