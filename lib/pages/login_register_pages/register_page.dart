import 'package:flutter/material.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/mock/user_model_mock_database.dart';
import 'package:uptodo/models/model_handlers/user_models_handler.dart';
import 'package:uptodo/pages/login_register_pages/login_page.dart';
import 'package:uptodo/pages/login_register_pages/models/register_login_model.dart';
import 'package:uptodo/pages/login_register_pages/widgets/input_text_field_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/login_register_button_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/login_register_page_divider_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/login_register_tips_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/third_way_login_register_button_widget.dart';
import 'package:uptodo/pages/login_register_pages/widgets/title_widget.dart';
import 'package:uptodo/utility/tools/NavigateHandler.dart';
import 'package:uptodo/widgets/empty_divider_widget.dart';

import '../home_pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            buildTitle(S.current.login_register_page_title_register),
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
            buildEmptyDivider(25),
            buildInputTextFieldWidget(
                context,
                S.current
                    .login_register_page_input_field_title_password_confirm,
                S.current
                    .login_register_page_input_field_placeholder_password_confirm,
                true, (newText) {
              model.passwordConfirm = newText;
            }),
            buildEmptyDivider(40),
            buildLoginRegisterButtonWidget(
              ELoginRegisterButtonType.register,
              () async {
                var result = model.registerCheck();
                debugPrint('检测结果为 : $result');
                if (result == ERegisterInfoCheckResult.valid) {
                  if (model.userName != null && model.password != null) {
                    //注册成功后，将注册的用户名及密码保存到 mock 数据库中
                    await UserModelMockDatabase.storeUserModelToDatabase(
                        model.userName!, model.password!);

                    // 同时，保存为  userModelsHandler 的 loginUser
                    await UserModelsHandler()
                        .loginSucceedHandle(model.userName!, model.password!);

                    if (mounted) {
                      NavigateHandler().push(context, const HomePage());
                    }
                  }
                }
              },
            ),
            const LoginRegisterPageDividerWidget(),
            ThirdWayLoginRegisterButtonWidget(
              EButtonType.register,
              EThirdWayType.google,
              () {
                debugPrint('使用 Google 帐号注册');
              },
            ),
            buildEmptyDivider(20),
            ThirdWayLoginRegisterButtonWidget(
              EButtonType.register,
              EThirdWayType.apple,
              () {
                debugPrint('使用 Apple 帐号注册');
              },
            ),
            const Spacer(),
            LoginRegisterTipsWidget(ETipsType.register, () {
              NavigateHandler().pushReplacement(
                context,
                const LoginPage(),
              );
            })
          ],
        ),
      ),
    );
  }
}
