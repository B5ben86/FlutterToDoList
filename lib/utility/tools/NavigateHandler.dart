import 'package:flutter/material.dart';

class NavigateHandler {
  // 静态变量指向自身
  static final NavigateHandler _instance = NavigateHandler._();
  // 私有构造器
  NavigateHandler._();
  // 方案2：工厂构造方法获得实例变量
  factory NavigateHandler() => _instance;

  void push(BuildContext context, final Widget newPage) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return newPage;
        },
      ),
    );
  }

  void pushReplacement(BuildContext context, final Widget newPage) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return newPage;
        },
      ),
    );
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}

/*
Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const IntroStepThreePage();
                  },
                ),
              );
*/