import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_dialog_widgets/popup_common_widgets/popup_dialog_bottom_buttons_widget.dart';

void showDeleteTaskPopupDialogWidget(
  BuildContext context,
  String taskName,
  Function() confirmDeleteCallback,
) {
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
          height: 200,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildTitleTextWidget(),
                const SizedBox(
                  height: 16,
                ),
                _buildWarningTextWidget(taskName),
                const Spacer(),
                buildDialogBottomButtonsWidget(
                  S.current.common_cancel,
                  S.current.common_delete,
                  () => {
                    Navigator.pop(context),
                  },
                  () => {
                    confirmDeleteCallback(),
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

Widget _buildTitleTextWidget() {
  return Column(
    children: [
      Text(
        S.current.edit_task_page_item_title_delete_task,
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

Widget _buildWarningTextWidget(String taskName) {
  String taskTitleName =
      "${S.current.edit_task_delete_task_popup_dialog_title_text}: $taskName";
  return Column(
    children: [
      Text(
        taskTitleName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        S.current.edit_task_delete_task_popup_dialog_warning_text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.red,
        ),
      ),
    ],
  );
}
