import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

enum ETipsType {
  register,
  login,
}

class LoginRegisterTipsWidget extends StatefulWidget {
  final ETipsType tipsType;
  final Function() onPressed;
  const LoginRegisterTipsWidget(this.tipsType, this.onPressed, {super.key});

  @override
  State<LoginRegisterTipsWidget> createState() =>
      _LoginRegisterTipsWidgetState();
}

class _LoginRegisterTipsWidgetState extends State<LoginRegisterTipsWidget> {
  String tipsText = '';
  Text getTipsText() {
    switch (widget.tipsType) {
      case ETipsType.register:
        tipsText = S.current.login_register_page_login_tips;
        break;
      case ETipsType.login:
        tipsText = S.current.login_register_page_register_tips;
        break;
    }
    return Text(
      tipsText,
      style: const TextStyle(
        fontSize: 12.0,
        color: Color.fromRGBO(155, 155, 155, 1.0),
        fontWeight: FontWeight.normal,
      ),
    );
  }

  TextButton getTextButton() {
    String buttonText = '';
    switch (widget.tipsType) {
      case ETipsType.register:
        buttonText = S.current.login_register_page_button_login;
        break;
      case ETipsType.login:
        buttonText = S.current.login_register_page_button_register;
        break;
    }
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0), minimumSize: Size.zero),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getTipsText(),
        getTextButton(),
      ],
    );
  }
}
