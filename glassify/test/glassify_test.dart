import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:glassify/glassify.dart';

void main() {
  testWidgets('GlassContainer renders child', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Glassify(
          child: Text('Hello Glass'),
        ),
      ),
    );

    expect(find.text('Hello Glass'), findsOneWidget);
  });
}
