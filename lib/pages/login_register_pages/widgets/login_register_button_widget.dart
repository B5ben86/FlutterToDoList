import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

enum ELoginRegisterButtonType {
  login,
  register,
}

Widget buildLoginRegisterButtonWidget(
    ELoginRegisterButtonType buttonType, void Function()? onPressed) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple,
      minimumSize: const Size.fromHeight(50),
    ),
    onPressed: onPressed,
    icon: Container(),
    label: _getButtonText(buttonType),
  );
}

Text _getButtonText(ELoginRegisterButtonType buttonType) {
  String buttonText = '';
  switch (buttonType) {
    case ELoginRegisterButtonType.login:
      buttonText = S.current.login_register_page_title_login;
      break;
    case ELoginRegisterButtonType.register:
      buttonText = S.current.login_register_page_button_register;
      break;
  }
  return Text(
    buttonText,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  );
}
