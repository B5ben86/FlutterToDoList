import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/home_pages/widgets/popup_widgets/popup_common_widgets/popup_dialog_bottom_buttons_widget.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

void showChooseTaskPriorityPopupDialogWidget(
    BuildContext context, int taskPriority) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            elevation: 0,
            insetPadding: const EdgeInsets.only(left: 8, right: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 450,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTitle(),
                  PriorityGridViewWidget(taskPriority, (selectedIndexNew) {
                    setState(() {
                      taskPriority = selectedIndexNew;
                    });
                  }),
                  buildDialogBottomButtonsWidget(
                      S.current.calendar_popup_dialog_button_cancel,
                      S.current.calendar_popup_dialog_button_choose_time, (() {
                    Navigator.pop(context);
                  }), (() {
                    Navigator.pop(context);
                  })),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildTitle() {
  return Column(
    children: const [
      SizedBox(
        height: 20,
      ),
      Text(
        'Task Priority',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Divider(
        thickness: 1,
        color: Color(0xff979797),
        indent: 8,
        endIndent: 8,
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

class PriorityGridViewWidget extends StatefulWidget {
  final int priorityIndex;
  final Function(int) onSelected;
  const PriorityGridViewWidget(this.priorityIndex, this.onSelected,
      {super.key});

  @override
  State<PriorityGridViewWidget> createState() => _PriorityGridViewWidgetState();
}

class _PriorityGridViewWidgetState extends State<PriorityGridViewWidget> {
  var priorityIndexTmp = 0;

  @override
  void initState() {
    priorityIndexTmp = widget.priorityIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 90,
            childAspectRatio: 1,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        itemCount: MaxPriority,
        itemBuilder: ((context, index) {
          return priorityItem(index, index == widget.priorityIndex, (() {
            widget.onSelected(index);
          }));
        }),
      ),
    );
  }

  Widget priorityItem(int priorityIndex, bool selected, Function() onPressed) {
    var backgroundColor =
        selected ? themeContext().primaryColor : const Color(0xff272727);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272727),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.flag_outlined,
              size: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              priorityIndex.toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
