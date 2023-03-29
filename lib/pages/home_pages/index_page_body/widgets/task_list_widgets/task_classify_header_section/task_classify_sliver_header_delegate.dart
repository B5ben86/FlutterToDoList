import 'package:flutter/material.dart';
import 'package:uptodo/pages/home_pages/index_page_body/widgets/task_list_widgets/task_classify_header_section/task_classify_header_section_widget.dart';

class TaskClassifySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final EHeaderSectionType headerSectionType;

  TaskClassifySliverHeaderDelegate({required this.headerSectionType});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TaskClassifyHeaderSectionWidget(headerSectionType);
  }

  @override
  double get maxExtent => (35 + 16);

  @override
  double get minExtent => (35 + 16);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
