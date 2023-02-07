import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/models/model_handlers/user_models_handler.dart';
import 'package:uptodo/pages/home_pages/home_page.dart';
import 'package:uptodo/pages/login_register_pages/login_page.dart';
import 'package:uptodo/pages/login_register_pages/register_page.dart';
import 'package:uptodo/pages/welcome_pages/intro_page_display_handle.dart';
import 'package:uptodo/stores/category_models_store.dart';
import 'package:uptodo/stores/task_models_store.dart';
import 'package:uptodo/utility/tools/NavigateHandler.dart';

class IntroLastPage extends StatefulWidget {
  const IntroLastPage({super.key});

  @override
  State<IntroLastPage> createState() => _IntroLastPageState();
}

class _IntroLastPageState extends State<IntroLastPage> {
  Widget buildTitleText() {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Text(
            S.current.intro_page_last_description_title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Divider(height: 26, color: Colors.transparent),
          Text(
            S.current.intro_page_last_description_detail,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withAlpha((67 / 100 * 255).toInt()),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            NavigateHandler().push(context, const LoginPage());
          },
          child: Text(S.current.login),
        ),
        const Divider(
          color: Colors.transparent,
        ),
        OutlinedButton(
          onPressed: () {
            NavigateHandler().push(context, const RegisterPage());
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          child: Text(
            S.current.register,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  //由于在initState 中调用UI相关的代码，需要使用 Future
  Future<void> _loginCheck() async {
    //弹出 loading 弹窗，模拟网络通讯延迟
    EasyLoading.show(
      status: '登录中...',
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    var loginUserModel = await UserModelsHandler().loadLoginUserMode();

    if (loginUserModel != null) {
      GetIt.I<TaskModelsStore>().loadFromDatabase();
      GetIt.I<CategoryModelsStore>().loadFromDatabase();
      await Future.delayed(const Duration(seconds: 1));
      //若已登录，则跳转到 HomePage
      if (mounted) {
        NavigateHandler().pushReplacement(context, const HomePage());
      }
    } else {
      await Future.delayed(const Duration(seconds: 1));
    }

    EasyLoading.dismiss();

    return;
  }

  @override
  void initState() {
    super.initState();
    //当显示到此页面后，下次打开 APP 不再显示引导页
    introPagesWereDisplayed();
    debugPrint('initState');
    _loginCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 58, bottom: 67, left: 32, right: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTitleText(),
            buildButtons(),
          ],
        ),
      ),
    );
  }
}
