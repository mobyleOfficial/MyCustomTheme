import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:my_custom_theme/src/my_generic_theme.dart';
import 'package:provider/provider.dart';

@sealed
class MyGenericThemeBuilder<T extends MyGenericTheme> with ChangeNotifier {
  MyGenericThemeBuilder({
    required List<T> themeList,
    T? selected,
  })  : _themeList = themeList,
        _selected = selected;

  final List<T> _themeList;
  T? _selected;

  _setSelected(T selected) {
    _selected = selected;
    notifyListeners();
  }

  static T selectedOf<T extends MyGenericTheme>(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<MyGenericThemeBuilder<T>>(
        context,
        listen: listen,
      )._selected as T;

  static setSelectedOf<T extends MyGenericTheme>(
    T selected, {
    required BuildContext context,
  }) {
    Provider.of<MyGenericThemeBuilder<T>>(
      context,
      listen: false,
    )._setSelected(selected);
  }

  static List<T> themeListOf<T extends MyGenericTheme>(
    BuildContext context, {
    bool listen = false,
  }) =>
      Provider.of<MyGenericThemeBuilder<T>>(
        context,
        listen: listen,
      )._themeList;

  Widget build({
    required WidgetBuilder builder,
  }) =>
      ChangeNotifierProvider(
        create: (_) => this,
        builder: (context, _) => builder(context),
      );
}
