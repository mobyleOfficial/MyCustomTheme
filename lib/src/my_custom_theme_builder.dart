import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:my_custom_theme/src/my_custom_theme.dart';
import 'package:provider/provider.dart';

@sealed
class MyCustomThemeBuilder with ChangeNotifier {
  MyCustomThemeBuilder({
    required List<MyCustomTheme> themeList,
    MyCustomTheme? selected,
  })  : _themeList = themeList,
        _selected = selected;

  final List<MyCustomTheme> _themeList;
  MyCustomTheme? _selected;

  _setSelected(MyCustomTheme selected) {
    _selected = selected;
    notifyListeners();
  }

  static T selectedOf<T extends MyCustomTheme>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<MyCustomThemeBuilder>(
        context,
        listen: listen,
      )._selected as T;

  static setSelectedOf<T extends MyCustomTheme>(
    T selected, {
    required BuildContext context,
  }) {
    Provider.of<MyCustomThemeBuilder>(
      context,
      listen: false,
    )._setSelected(selected);
  }

  static List<T> themeListOf<T extends MyCustomTheme>(
    BuildContext context, {
    bool listen = false,
  }) =>
      Provider.of<MyCustomThemeBuilder>(
        context,
        listen: listen,
      )._themeList.map((theme) => theme as T).toList();

  Widget build({
    required WidgetBuilder builder,
  }) =>
      ChangeNotifierProvider(
        create: (_) => this,
        builder: (context, _) => builder(context),
      );
}
