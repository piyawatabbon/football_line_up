// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:football_test/main.dart';

void main() {
  testWidgets('Formation app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FormationApp());

    // Verify that the app loads with football formation
    expect(find.text('Football Formation (Top/Bottom)'), findsOneWidget);
    expect(find.text('Team A (TOP)  •  433'), findsOneWidget);
    expect(find.text('Team B (BOTTOM)  •  442'), findsOneWidget);
  });
}
