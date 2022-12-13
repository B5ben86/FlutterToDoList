import 'package:flutter/material.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/add_task_popup_dialog/items/build_task_detail_setting_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/add_task_popup_dialog/items/build_task_info_input_text_field_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/add_task_popup_dialog/items/build_title_text_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/calendar_popup_dialog/calendar_popup_dialog_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/choose_task_priority_popup_dialog/choose_task_priority_popup_dialog_widget.dart';

void showAddTaskPopupDialogWidget(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
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
                buildTaskInfoInputTextFieldWidget(
                  'Please Input Task Name',
                  true,
                  (text) {
                    debugPrint('onEditChanged : $text');
                  },
                  (text) {
                    debugPrint('onSubmitted : $text');
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                buildTaskInfoInputTextFieldWidget(
                  'Please Input Task Description',
                  false,
                  (text) {
                    debugPrint('onEditChanged : $text');
                  },
                  (text) {
                    debugPrint('onSubmitted : $text');
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                buildTaskDetailSettingWidget(context, (itemType) {
                  if (itemType == ETaskSettingItemType.clock) {
                    showCalendarPopupDialogWidget(context, ((selectedDay) {
                      debugPrint('selected day : ${selectedDay.toLocal()}');
                    }));
                  } else if (itemType == ETaskSettingItemType.priority) {
                    showChooseTaskPriorityPopupDialogWidget(context, 1);
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
