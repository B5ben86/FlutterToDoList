import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/model_handlers/user_models_handler.dart';
import 'package:uptodo/providers/task_model_map_change_notifier.dart';

class ProfilePageTopBannerWidget extends StatelessWidget {
  const ProfilePageTopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var userModel = UserModelsHandler().getLoginUserModel();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 86,
          onPressed: () {},
          icon: const CircleAvatar(
            radius: 43,
            foregroundImage: NetworkImage('https://i.pravatar.cc/100'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          userModel?.userName ?? '',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 58,
              width: 154,
              alignment: Alignment.center,
              child: Text(
                '${context.watch<TaskModelMapChangeNotifier>().todoTaskAmount} ${S.current.profile_page_task_left}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 58,
              width: 154,
              alignment: Alignment.center,
              child: Text(
                '${context.watch<TaskModelMapChangeNotifier>().completedTaskAmount} ${S.current.profile_page_task_done}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
