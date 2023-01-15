import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_custom_theme/src/my_generic_theme.dart';
import 'package:my_custom_theme/src/my_generic_theme_builder.dart';

import 'mocks/my_themes.dart';

void main() {
  final themeList = [
    GenericA(),
    GenericB(),
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
      MyGenericThemeBuilder.themeListOf<MyGenericTheme>(mockContext),
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
      MyGenericThemeBuilder.selectedOf<MyGenericTheme>(
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
      MyGenericThemeBuilder.selectedOf<MyGenericTheme>(
        mockContext,
        listen: false,
      ),
      themeList.last,
    );
  });
}
