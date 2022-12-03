import 'package:flutter/material.dart';

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

// class _TaskClassifyHeaderSectionWidgetState
//     extends State<TaskClassifyHeaderSectionWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // var screenWidth = MediaQuery.of(context).size.width;
//     // var rightPadding = screenWidth - 76;
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Card(
//         elevation: 0,
//         margin: const EdgeInsets.only(bottom: 16),
//         color: const Color(0xFF363636),
//         child: SizedBox(
//           height: 31,
//           width: 102,
//           child: Padding(
//             padding:
//                 const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   getHeaderTypeName(),
//                   style: const TextStyle(fontSize: 12),
//                 ),
//                 const Icon(
//                   Icons.arrow_drop_down,
//                   size: 16,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

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
          height: 31,
          decoration: BoxDecoration(
            color: const Color(0xFF363636),
            borderRadius: BorderRadius.circular(4),
          ),
          // color: const Color(0xFF363636),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getHeaderTypeName(),
                  style: const TextStyle(fontSize: 12),
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
        return 'today';
      case EHeaderSectionType.completed:
        return 'completed';
    }
  }
}
