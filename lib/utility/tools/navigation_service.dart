import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

ThemeData themeContext() {
  return Theme.of(NavigationService.navigatorKey.currentContext!);
}
