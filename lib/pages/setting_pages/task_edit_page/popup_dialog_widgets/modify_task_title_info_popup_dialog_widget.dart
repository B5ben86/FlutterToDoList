import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/popup_common_widgets/build_popup_dialog_input_text_field_widget.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/popup_common_widgets/popup_dialog_bottom_buttons_widget.dart';

void showModifyTaskTitleInfoPopupDialogWidget(
    BuildContext context,
    String taskTitleRaw,
    String taskDescriptionRaw,
    Function(String taskTitleNew, String taskDescriptionNew) confirmEdit) {
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
            padding:
                const EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                buildTitleTextWidget(),
                const SizedBox(
                  height: 16,
                ),
                buildPopupDialogInputTextFieldWidget(
                  taskTitleRaw,
                  'Please Input Task Name',
                  true,
                  (text) {
                    debugPrint('onEditChanged : $text');
                    taskTitleRaw = text;
                  },
                  (text) {
                    debugPrint('onSubmitted : $text');
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                buildPopupDialogInputTextFieldWidget(
                  taskDescriptionRaw,
                  'Please Input Task Description',
                  false,
                  (text) {
                    debugPrint('onEditChanged : $text');
                    taskDescriptionRaw = text;
                  },
                  (text) {
                    debugPrint('onSubmitted : $text');
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                buildDialogBottomButtonsWidget(
                  S.current.common_cancel,
                  S.current.edit_task_title_popup_dialog_edit_button_text,
                  () => {
                    Navigator.pop(context),
                  },
                  () => {
                    confirmEdit(taskTitleRaw, taskDescriptionRaw),
                    Navigator.pop(context),
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget buildTitleTextWidget() {
  return Column(
    children: [
      Text(
        S.current.edit_task_title_popup_dialog_title_text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      const Divider(
        height: 1,
        thickness: 1,
        color: Color(0xff979797),
      ),
    ],
  );
}