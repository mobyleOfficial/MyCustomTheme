import 'package:flutter/widgets.dart';
import 'package:my_custom_theme/src/my_generic_theme.dart';

import 'my_base_theme.dart';

class LightTheme implements MyCustomBaseTheme {
  @override
  String nameOf(BuildContext context) => "Light theme";
}

class DarkTheme implements MyCustomBaseTheme {
  @override
  String nameOf(BuildContext context) => "Dark theme";
}

class GenericA implements MyGenericTheme {}

class GenericB implements MyGenericTheme {}
