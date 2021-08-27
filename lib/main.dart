import 'package:flutter/material.dart';
import 'package:pr_flutter_1/pages/login_page.dart';
import 'package:pr_flutter_1/pages/singup_page.dart';
import 'package:pr_flutter_1/pages/splash_page.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
    routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => LoginPage(),
      '/register': (BuildContext context) => RegisterPage(),
    },
  ));
}
