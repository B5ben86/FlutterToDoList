import 'package:flutter/material.dart';

enum EProfileItemType {
  appSetting,
  changeAccountName,
  changeAccountPassword,
  changeAccountImage,
  aboutUs,
  faq,
  help,
  support,
  logout,
}

class ProfileInfoListItemWidget extends StatelessWidget {
  final EProfileItemType itemType;
  final Function? itemOnClick;
  const ProfileInfoListItemWidget(this.itemType, this.itemOnClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: GestureDetector(
        onTap: () {
          itemOnClick?.call();
        },
        child: Row(
          children: [
            Icon(
              _getIconData(),
              size: 24,
              color: itemType != EProfileItemType.logout
                  ? Colors.white
                  : Colors.red,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              _getTitleText(),
              style: TextStyle(
                fontSize: 16,
                color: itemType != EProfileItemType.logout
                    ? Colors.white
                    : Colors.red,
              ),
            ),
            const Spacer(),
            Visibility(
              visible: itemType != EProfileItemType.logout,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData() {
    late IconData iconData;
    switch (itemType) {
      case EProfileItemType.appSetting:
        iconData = Icons.settings_outlined;
        break;
      case EProfileItemType.changeAccountName:
        iconData = Icons.person_outline;
        break;
      case EProfileItemType.changeAccountPassword:
        iconData = Icons.key_outlined;
        break;
      case EProfileItemType.changeAccountImage:
        iconData = Icons.image_outlined;
        break;
      case EProfileItemType.aboutUs:
        iconData = Icons.gif_box_outlined;
        break;
      case EProfileItemType.faq:
        iconData = Icons.question_answer_outlined;
        break;
      case EProfileItemType.help:
        iconData = Icons.help_outline;
        break;
      case EProfileItemType.support:
        iconData = Icons.support_agent_outlined;
        break;
      case EProfileItemType.logout:
        iconData = Icons.logout_outlined;
        break;
    }

    return iconData;
  }

  String _getTitleText() {
    String title = '';
    switch (itemType) {
      case EProfileItemType.appSetting:
        title = "APP Setting";
        break;
      case EProfileItemType.changeAccountName:
        title = "Account Name";
        break;
      case EProfileItemType.changeAccountPassword:
        title = "Account Password";
        break;
      case EProfileItemType.changeAccountImage:
        title = "Account Avatar";
        break;
      case EProfileItemType.aboutUs:
        title = "About US";
        break;
      case EProfileItemType.faq:
        title = "FAQ";
        break;
      case EProfileItemType.help:
        title = "Help & Feedback";
        break;
      case EProfileItemType.support:
        title = "Support";
        break;
      case EProfileItemType.logout:
        title = "Logout";
        break;
    }
    return title;
  }
}
