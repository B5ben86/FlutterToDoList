import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/utility/svg_images/svg_images_getter.dart';
import 'package:uptodo/widgets/empty_divider_widget.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buildEmptyNoticeContent();
  }

  Widget buildEmptyNoticeContent() {
    return Center(
      child: Column(
        children: [
          buildImage(),
          buildNotice(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 75),
      child: indexBodyEmptyNoticeImageSvg,
    );
  }

  Widget buildNotice() {
    return Column(
      children: [
        Text(
          S.current.index_body_empty_notice,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        buildEmptyDivider(10),
        Text(
          S.current.index_body_empty_tips,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
