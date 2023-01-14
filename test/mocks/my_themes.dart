import 'package:flutter/widgets.dart';

import 'my_base_theme.dart';

class LightTheme extends MyCustomBaseTheme {
  @override
  String nameOf(BuildContext context) => "Light theme";
}

class DarkTheme extends MyCustomBaseTheme {
  @override
  String nameOf(BuildContext context) => "Dark theme";
}
