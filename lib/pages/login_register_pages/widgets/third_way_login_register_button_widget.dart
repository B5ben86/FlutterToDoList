import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/utility/svg_images/svg_images_getter.dart';

enum EThirdWayType { google, apple }

enum EButtonType { register, login }

class ThirdWayLoginRegisterButtonWidget extends StatefulWidget {
  final EButtonType buttonType;
  final EThirdWayType thirdWayType;
  final Function()? onPressed;

  const ThirdWayLoginRegisterButtonWidget(
      this.buttonType, this.thirdWayType, this.onPressed,
      {super.key});

  @override
  State<ThirdWayLoginRegisterButtonWidget> createState() =>
      _ThirdWayLoginRegisterButtonWidgetState();
}

class _ThirdWayLoginRegisterButtonWidgetState
    extends State<ThirdWayLoginRegisterButtonWidget> {
  Widget getButtonIcon() {
    switch (widget.thirdWayType) {
      case EThirdWayType.google:
        return googleIconImageSvg;

      case EThirdWayType.apple:
        return appleIconImageSvg;
    }
  }

  Text getButtonText() {
    String buttonText = '';
    switch (widget.thirdWayType) {
      case EThirdWayType.google:
        buttonText = widget.buttonType == EButtonType.register
            ? S.current.login_register_page_button_register_with_google
            : S.current.login_register_page_button_login_with_google;
        break;
      case EThirdWayType.apple:
        buttonText = widget.buttonType == EButtonType.register
            ? S.current.login_register_page_button_register_with_apple
            : S.current.login_register_page_button_login_with_apple;
        break;
    }
    return Text(
      buttonText,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: widget.onPressed,
      style: OutlinedButton.styleFrom(
        alignment: Alignment.center,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
      icon: getButtonIcon(),
      label: getButtonText(),
    );
  }
}
