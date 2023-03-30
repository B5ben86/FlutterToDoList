import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/add_task_popup_dialog/items/build_task_detail_setting_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/add_task_popup_dialog/items/build_title_text_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/calendar_popup_dialog/calendar_popup_dialog_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/choose_category_popup_dialog/choose_category_popup_dialog_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/choose_task_priority_popup_dialog/choose_task_priority_popup_dialog_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/popup_common_widgets/build_popup_dialog_input_text_field_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/toast_widgets/notice_popup_toast/notice_toast.dart';
import 'package:uptodo/providers/category_model_map_change_notifier.dart';
import 'package:uptodo/providers/task_model_map_change_notifier.dart';

void showAddTaskPopupDialogWidget(
    BuildContext context, DateTime defaultDateTime) {
  showDialog(
    context: context,
    builder: (context) {
      var taskModelNew = TaskModel(
          '',
          '',
          defaultDateTime,
          0,
          context.read<CategoryModelMapChangeNotifier>().getModelList[0],
          false);

      var taskNameEditingController = TextEditingController();
      var taskDescriptionEditingController = TextEditingController();

      return Dialog(
        elevation: 0,
        insetPadding: const EdgeInsets.only(left: 8, right: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildTitleTextWidget(),
                const SizedBox(
                  height: 14,
                ),
                buildPopupDialogInputTextFieldWidget(
                  S.current.add_task_popup_dialog_warning_task_name_empty,
                  true,
                  taskNameEditingController,
                ),
                const SizedBox(
                  height: 14,
                ),
                buildPopupDialogInputTextFieldWidget(
                  S.current
                      .add_task_popup_dialog_warning_task_description_empty,
                  false,
                  taskDescriptionEditingController,
                ),
                const SizedBox(
                  height: 14,
                ),
                buildTaskDetailSettingWidget(context, (itemType) {
                  switch (itemType) {
                    case ETaskSettingItemType.clock:
                      showCalendarPopupDialogWidget(context, ((selectedDay) {
                        taskModelNew.dateTime = selectedDay;
                        debugPrint('selected day : ${selectedDay.toLocal()}');
                      }));
                      break;
                    case ETaskSettingItemType.tag:
                      showChooseCategoryPopupDialogWidget(context,
                          ((categoryModel) {
                        taskModelNew.categoryModel = categoryModel;
                        debugPrint(
                            'selected category model : ${categoryModel.toJson()}');
                      }));
                      break;
                    case ETaskSettingItemType.priority:
                      showChooseTaskPriorityPopupDialogWidget(context, 0,
                          ((taskPriorityNew) {
                        taskModelNew.priority = taskPriorityNew;
                        debugPrint('taskPriorityNew = $taskPriorityNew');
                      }));
                      break;
                    case ETaskSettingItemType.confirm:
                      taskModelNew.taskName = taskNameEditingController.text;
                      taskModelNew.taskDescription =
                          taskDescriptionEditingController.text;

                      if (taskModelNew.taskName.isEmpty) {
                        noticeToast(S.current
                            .add_task_popup_dialog_warning_task_name_empty);
                      } else if (taskModelNew.taskDescription.isEmpty) {
                        noticeToast(S.current
                            .add_task_popup_dialog_warning_task_description_empty);
                      } else {
                        // GetIt.I<TaskModelsStore>().insertTaskModel(taskModelNew);
                        context
                            .read<TaskModelMapChangeNotifier>()
                            .insertTaskModel(taskModelNew);
                        Navigator.pop(context);
                      }

                      break;
                  }

                  debugPrint('Task Detail Setting Item on pressed : $itemType');
                }),
              ],
            ),
          ),
        ),
      );
    },
  );
}
