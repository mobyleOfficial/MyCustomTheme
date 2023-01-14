import 'package:flutter/widgets.dart';
import 'package:my_custom_theme/my_custom_theme.dart';

abstract class MyCustomBaseTheme extends MyCustomTheme {
  Color get background;
  Color get foreground;
}

class MyCustomLightTheme extends MyCustomBaseTheme {
  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get foreground => const Color(0xFF000000);

  @override
  String nameOf(BuildContext context) => "Light Theme!";
}

class MyCustomDarkTheme extends MyCustomBaseTheme {
  @override
  Color get background => const Color(0xFF000000);

  @override
  Color get foreground => const Color(0xFFFFFFFF);

  @override
  String nameOf(BuildContext context) => "Dark Theme!";
}
