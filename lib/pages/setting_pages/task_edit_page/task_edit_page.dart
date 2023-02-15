import 'package:flutter/material.dart';
import 'package:uptodo/models/task_model/task_model.dart';
import 'package:uptodo/pages/setting_pages/task_edit_page/task_edit_page_app_bar_widget.dart';

class TaskEditPage extends StatefulWidget {
  final TaskModel taskModel;
  const TaskEditPage(this.taskModel, {super.key});

  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TaskEditPageAppBarWidget(
          () {
            debugPrint('close button');
          },
          () {
            debugPrint('refresh button');
          },
        ),
        body: Column(
          children: [
            _buildTaskNameAndDescriptionContent(),
          ],
        ));
  }

  Widget _buildTaskNameAndDescriptionContent() {
    return Container(
      child: Row(
        children: const [
          Text('test'),
        ],
      ),
    );
  }
}
