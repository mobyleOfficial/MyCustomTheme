import 'package:flutter/material.dart';
import 'package:my_custom_theme/my_custom_theme.dart';
import 'package:my_custom_theme_sample/src/app.dart';
import 'package:my_custom_theme_sample/src/my_custom_base_theme.dart';

void main() async {
  final myCustomThemeList = [
    MyCustomLightTheme(),
    MyCustomDarkTheme(),
  ];

  runApp(
    MyCustomThemeBuilder(
      themeList: myCustomThemeList,
      selected: myCustomThemeList.first,
    ).build(
      builder: (_) => const MyApp(),
    ),
  );
}
