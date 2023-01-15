import 'package:flutter/widgets.dart';
import 'package:my_custom_theme/src/my_generic_theme.dart';

import 'my_base_theme.dart';

class LightTheme extends MyCustomBaseTheme {
  @override
  String nameOf(BuildContext context) => "Light theme";
}

class DarkTheme extends MyCustomBaseTheme {
  @override
  String nameOf(BuildContext context) => "Dark theme";
}

class GenericA extends MyGenericTheme {}

class GenericB extends MyGenericTheme {}
