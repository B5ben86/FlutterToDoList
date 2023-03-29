import 'package:flutter/material.dart';

class TaskEditPageAppBarWidget extends AppBar {
  final Function() closeButtonClick;
  final Function() refreshButtonClick;
  TaskEditPageAppBarWidget(this.closeButtonClick, this.refreshButtonClick,
      {super.key});

  @override
  State<TaskEditPageAppBarWidget> createState() =>
      _TaskEditPageAppBarWidgetState();
}

class _TaskEditPageAppBarWidgetState extends State<TaskEditPageAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: buildLeadingImageButton(),
      actions: [
        buildAvatarButton(),
      ],
    );
  }

  Widget buildLeadingImageButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        height: 32,
        width: 32,
        child: IconButton(
          onPressed: widget.closeButtonClick,
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }

  Widget buildAvatarButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Visibility(
        visible: false,
        child: SizedBox(
          height: 32,
          width: 32,
          child: IconButton(
            onPressed: widget.refreshButtonClick,
            icon: const Icon(Icons.cached),
          ),
        ),
      ),
    );
  }
}
