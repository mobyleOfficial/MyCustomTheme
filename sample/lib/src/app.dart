import 'package:flutter/material.dart';
import 'package:my_custom_theme/my_custom_theme.dart';
import 'package:my_custom_theme_sample/src/my_custom_base_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (
        RouteSettings routeSettings,
      ) =>
          MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) {
          final selectedTheme =
              MyCustomThemeBuilder.selectedOf<MyCustomBaseTheme>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: selectedTheme.foreground,
                ),
              ),
              foregroundColor: selectedTheme.foreground,
              backgroundColor: selectedTheme.background,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButton(
                value: selectedTheme,
                onChanged: (value) {
                  if (value != null) {
                    MyCustomThemeBuilder.setSelectedOf(
                      value,
                      context: context,
                    );
                  }
                },
                items: MyCustomThemeBuilder.themeListOf(context)
                    .map(
                      (theme) => DropdownMenuItem(
                        value: theme,
                        child: Text(theme.nameOf(context)),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
