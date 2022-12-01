import 'package:flutter/material.dart';
import 'package:uptodo/models/task_model/task_model.dart';

class PriorityWidget extends StatelessWidget {
  final Function() onPressed;
  final ETaskPriority priority;
  const PriorityWidget(this.priority, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 30,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2.0,
            color: Theme.of(context).primaryColor,
          ),
          padding: const EdgeInsets.only(left: 8, right: 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.flag_outlined,
              color: Colors.white,
              size: 14,
            ),
            const Spacer(),
            Text(
              priority.index.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
