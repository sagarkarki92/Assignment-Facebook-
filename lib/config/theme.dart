import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final _appPrimaryColor = Colors.blue;
  static final _scaffoldBackgroundColor = Color(0xFFF0F2F5);

  static ThemeData customeTheme() {
    return Platform.isIOS
        ? _myIosTheme(ThemeData.light())
        : _myAndroidTheme(ThemeData.light());
  }

  static ThemeData _myAndroidTheme(ThemeData baseTheme) {
    return baseTheme.copyWith(
      primaryColor: _appPrimaryColor,
      accentColor: Colors.pink,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: _scaffoldBackgroundColor,
    );
  }

  static CupertinoThemeData _myIosTheme(ThemeData baseTheme) {
    return CupertinoThemeData(
        primaryColor: _appPrimaryColor,
        scaffoldBackgroundColor: _scaffoldBackgroundColor);
  }
}
