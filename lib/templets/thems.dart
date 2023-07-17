import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  Color mainColor = const Color(0xffab7ec1);
  Color buttonColor = const Color(0xFF533f6a);
  Color appBarColor = const Color(0xFFc793ce);
}

class buildTheme{
  Color maintheme = Colors.black;
   bool isDark = true;

  buildTheme( this.maintheme,  this.isDark);
}
/*
MaterialApp(
title: 'App Title',
theme: ThemeData(
brightness: Brightness.light,
*/
/* light theme settings *//*

),
darkTheme: ThemeData(
brightness: Brightness.dark,
*/
/* dark theme settings *//*

),
themeMode: ThemeMode.dark,
*/
/* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      *//*

debugShowCheckedModeBanner: false,
home: YourAppHomepage(),
);*/
