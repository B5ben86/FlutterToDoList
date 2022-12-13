import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/task_model/category_model.dart';

void showChooseCategoryPopupDialogWidget(BuildContext context,
    Function(CategoryModel categoryModel) categorySelected) {
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
    children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        S.current.choose_category_popup_dialog_title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Divider(
        thickness: 1,
        color: Color(0xff979797),
        indent: 8,
        endIndent: 8,
      ),
      const SizedBox(
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
        itemCount: 10,
        itemBuilder: ((context, index) {
          return priorityItem((() {
            widget.onSelected(index);
          }));
        }),
      ),
    );
  }

  Widget priorityItem(Function() onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272727),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.red),
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
              1.toString(),
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
