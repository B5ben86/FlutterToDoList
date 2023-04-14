import 'package:flutter/material.dart';

enum EProfileHeaderType {
  setting,
  account,
  uptodo,
}

class ProfileInfoListHeaderWidget extends StatelessWidget {
  final EProfileHeaderType headerType;
  const ProfileInfoListHeaderWidget(this.headerType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      alignment: Alignment.bottomLeft,
      child: Text(
        _getHeaderTitle(),
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xffafafaf),
        ),
      ),
    );
  }

  String _getHeaderTitle() {
    String title = '';
    switch (headerType) {
      case EProfileHeaderType.setting:
        title = 'Setting';
        break;
      case EProfileHeaderType.account:
        title = 'Account';
        break;
      case EProfileHeaderType.uptodo:
        title = 'Uptodo';
        break;
    }
    return title;
  }
}
