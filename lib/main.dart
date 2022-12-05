import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uptodo/generated/l10n.dart';
import 'package:uptodo/pages/welcome_pages/welcome_page.dart';
import 'package:uptodo/utility/get_it_initial/GetItInitial.dart';
import 'package:uptodo/utility/tools/navigation_service.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'UpToDo',
      theme: ThemeData(
        // colorScheme: const ColorScheme(
        //     brightness: Brightness.dark,
        //     primary: Colors.deepPurple,
        //     onPrimary: Col,
        //     secondary: secondary,
        //     onSecondary: onSecondary,
        //     error: error,
        //     onError: onError,
        //     background: background,
        //     onBackground: onBackground,
        //     surface: surface,
        //     onSurface: onSurface,
        //     ),
        // primaryColor: Colors.deepPurple,
        primaryColor: const Color(0xff8687e7),
        cardColor: const Color(0xFF363636),
        brightness: Brightness.dark,

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
