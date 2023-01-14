import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_custom_theme/my_custom_theme.dart';

import 'mocks/my_base_theme.dart';
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
      MyGenericThemeBuilder(
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
      MyGenericThemeBuilder.themeListOf<MyCustomBaseTheme>(mockContext),
      themeList,
    );
  });

  testWidgets('test selected of', (tester) async {
    late BuildContext mockContext;

    await tester.pumpWidget(
      MyGenericThemeBuilder(
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
      MyGenericThemeBuilder.selectedOf<MyCustomBaseTheme>(
        mockContext,
        listen: false,
      ),
      themeList.first,
    );
  });

  testWidgets('test set selected of', (tester) async {
    late BuildContext mockContext;

    await tester.pumpWidget(
      MyGenericThemeBuilder(
        themeList: themeList,
        selected: themeList.first,
      ).build(
        builder: (context) {
          mockContext = context;
          return placeholder;
        },
      ),
    );

    MyGenericThemeBuilder.setSelectedOf(themeList.last, context: mockContext);

    expect(
      MyGenericThemeBuilder.selectedOf<MyCustomBaseTheme>(
        mockContext,
        listen: false,
      ),
      themeList.last,
    );
  });
}
