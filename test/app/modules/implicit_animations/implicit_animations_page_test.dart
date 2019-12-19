import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:animations_flutter/app/modules/implicit_animations/implicit_animations_page.dart';

main() {
  testWidgets('ImplicitAnimationsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        ImplicitAnimationsPage(title: 'ImplicitAnimations')));
    final titleFinder = find.text('ImplicitAnimations');
    expect(titleFinder, findsOneWidget);
  });
}
