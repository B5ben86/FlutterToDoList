import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

enum EHeaderSectionType {
  today,
  completed,
}

class TaskClassifyHeaderSectionWidget extends StatefulWidget {
  final EHeaderSectionType headerSectionType;
  const TaskClassifyHeaderSectionWidget(this.headerSectionType, {super.key});

  @override
  State<TaskClassifyHeaderSectionWidget> createState() =>
      _TaskClassifyHeaderSectionWidgetState();
}

class _TaskClassifyHeaderSectionWidgetState
    extends State<TaskClassifyHeaderSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getHeaderTypeName(),
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getHeaderTypeName() {
    switch (widget.headerSectionType) {
      case EHeaderSectionType.today:
        return S.current.index_body_task_list_header_section_task_type_today;
      case EHeaderSectionType.completed:
        return S
            .current.index_body_task_list_header_section_task_type_completed;
    }
  }
}
