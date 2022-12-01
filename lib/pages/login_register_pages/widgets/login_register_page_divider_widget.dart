import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';

class LoginRegisterPageDividerWidget extends StatelessWidget {
  const LoginRegisterPageDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Color.fromRGBO(151, 151, 151, 1.0),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            S.current.login_register_page_divider_text,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            width: 5,
          ),
          const Expanded(
            child: Divider(
              color: Color.fromRGBO(151, 151, 151, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
