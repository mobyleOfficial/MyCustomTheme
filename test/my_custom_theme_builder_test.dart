import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_custom_theme/src/my_custom_theme_builder.dart';

import 'mocks/my_themes.dart';

void main() {
  final themeList = [
    LightTheme(),
    DarkTheme(),
  ];

  const placeholder = Placeholder();

  testWidgets('test theme list of', (tester) async {
    late BuildContext mockContext;

    await tester.pumpWidget(
      MyCustomThemeBuilder(
        themeList: themeList,
        selected: themeList.first,
      ).build(
        builder: (context) {
          mockContext = context;
          return placeholder;
        },
      ),
    );

    expect(MyCustomThemeBuilder.themeListOf(mockContext), themeList);
  });

  testWidgets('test selected of', (tester) async {
    late BuildContext mockContext;

    await tester.pumpWidget(
      MyCustomThemeBuilder(
        themeList: themeList,
        selected: themeList.first,
      ).build(
        builder: (context) {
          mockContext = context;
          return placeholder;
        },
      ),
    );

    expect(
      MyCustomThemeBuilder.selectedOf(
        mockContext,
        listen: false,
      ),
      themeList.first,
    );
  });

  testWidgets('test set selected of', (tester) async {
    late BuildContext mockContext;

    await tester.pumpWidget(
      MyCustomThemeBuilder(
        themeList: themeList,
        selected: themeList.first,
      ).build(
        builder: (context) {
          mockContext = context;
          return placeholder;
        },
      ),
    );

    MyCustomThemeBuilder.setSelectedOf(themeList.last, context: mockContext);

    expect(
      MyCustomThemeBuilder.selectedOf(
        mockContext,
        listen: false,
      ),
      themeList.last,
    );
  });
}
