import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/mock/user_model_mock_database.dart';
import 'package:uptodo/models/model_handlers/user_models_handler.dart';
import 'package:uptodo/pages/home_pages/home_page.dart';
import 'package:uptodo/pages/login_register_pages/models/register_login_model.dart';
import 'package:uptodo/pages/login_register_pages/register_page.dart';
import 'package:uptodo/pages/login_register_pages/widgets/input_text_field_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/login_register_button_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/login_register_page_divider_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/login_register_tips_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/third_way_login_register_button_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/title_widget.dart';
import 'package:uptodo/utility/tools/NavigateHandler.dart';
import 'package:uptodo/widgets/empty_divider_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  RegisterLoginModel model = RegisterLoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(S.current.login_register_page_title_login),
            buildEmptyDivider(25),
            buildInputTextFieldWidget(
                context,
                S.current.login_register_page_input_field_title_username,
                S.current.login_register_page_input_field_placeholder_username,
                false, ((newText) {
              model.userName = newText;
            })),
            buildEmptyDivider(25),
            buildInputTextFieldWidget(
                context,
                S.current.login_register_page_input_field_title_password,
                S.current.login_register_page_input_field_placeholder_password,
                true, ((newText) {
              model.password = newText;
            })),
            buildEmptyDivider(40),
            buildLoginRegisterButtonWidget(
              ELoginRegisterButtonType.login,
              () async {
                var result = model.loginCheck();
                debugPrint('Login check result : $result');
                if (result == ERegisterInfoCheckResult.valid) {
                  var registerUserModelInDB =
                      await UserModelMockDatabase.loadUserModelFromDatabase(
                          model.userName!);
                  if (registerUserModelInDB != null) {
                    if (model.userName == registerUserModelInDB.userName &&
                        model.password == registerUserModelInDB.password) {
                      debugPrint('登录成功');

                      await UserModelsHandler()
                          .loginSucceedHandle(model.userName!, model.password!);

                      if (!mounted) return;
                      NavigateHandler()
                          .pushReplacement(context, const HomePage());
                    }
                  }
                }
              },
            ),
            const LoginRegisterPageDividerWidget(),
            ThirdWayLoginRegisterButtonWidget(
              EButtonType.login,
              EThirdWayType.google,
              () {
                debugPrint('使用 Google 帐号登录');
              },
            ),
            buildEmptyDivider(20),
            ThirdWayLoginRegisterButtonWidget(
              EButtonType.login,
              EThirdWayType.apple,
              () {
                debugPrint('使用 Apple 帐号登录');
              },
            ),
            const Spacer(),
            LoginRegisterTipsWidget(
              ETipsType.login,
              () {
                NavigateHandler().pushReplacement(
                  context,
                  const RegisterPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
