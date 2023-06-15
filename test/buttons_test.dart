import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_life/main.dart';



void main() {
  testWidgets("Start App", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(AlertDialog), findsNothing);
    print("app starts ok");

    await tester.pumpAndSettle();

    var start_stop_button = find.byKey(ValueKey("start_stop"));
    expect(start_stop_button, findsOneWidget);
    await tester.tap(start_stop_button);
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    print("stop button pressed - no error");

    await tester.pumpAndSettle();

    expect(find.byKey(ValueKey("start_stop")), findsOneWidget);
    expect(start_stop_button, findsOneWidget);
    await tester.tap(start_stop_button);
    await tester.pumpAndSettle();
    print("start button pressed - no error");


    expect(find.byKey(ValueKey("clear")), findsOneWidget);
    expect(start_stop_button, findsOneWidget);
    await tester.tap(start_stop_button);
    await tester.pumpAndSettle();
    print("clear pressed - no error");


    expect(find.byKey(ValueKey("exit")), findsOneWidget);
    expect(start_stop_button, findsOneWidget);
    await tester.tap(start_stop_button);
    await tester.pumpAndSettle();
    print("exit button pressed - no error");

  });
}