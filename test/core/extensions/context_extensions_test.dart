import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:csms/core/extensions/context_extensions.dart';

void main() {
  testWidgets('ContextExt provides easy access to theme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        home: Builder(
          builder: (context) {
            expect(context.isDarkMode, isFalse);
            return Container();
          },
        ),
      ),
    );
  });
}
