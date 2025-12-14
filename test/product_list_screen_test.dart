import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:minii_shop/screens/product_list_screen.dart';
import 'package:minii_shop/providers/product_provider.dart';
import 'package:minii_shop/providers/theme_provider.dart';

void main() {
  testWidgets('ProductListScreen hiển thị tiêu đề',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const MaterialApp(
          home: ProductListScreen(),
        ),
      ),
    );

    expect(find.text('Mini Shop'), findsOneWidget);
  });
}
