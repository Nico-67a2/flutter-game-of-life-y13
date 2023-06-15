import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_life/gol/globals.dart';

void main() {
  Widget createWidgetForTesting({Widget? child}){
    return MaterialApp(
      home: child,
    );
  }

    testWidgets('Slider take on discrete values', (WidgetTester tester) async {
      final Key sliderKey = new UniqueKey();
      double value = 0.0;
      await tester.pumpWidget(
          createWidgetForTesting(child: new Directionality(
          textDirection: TextDirection.ltr,
          child: new StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return new Material(
                child: new Center(
                  child: new SizedBox(
                    width: 200.0 + 2 * 16.0, // _kPreferredTotalWidth
                    child: new Slider(
                      key: sliderKey,
                      min: 0.0,
                      max: 2000.0,
                      divisions: 5,
                      value: value,
                      onChanged: (double newValue) {
                        setState(() {
                          value =  newValue;
                          refreshrate = startingmilliseconds - value.toInt();
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        )
          ),
      );


       expect(value, equals(0.0));
       print("initial value $value");
       print("The timer refresh rate is $refreshrate ms");
       expect(value, equals(0.0));
       await tester.drag(find.byKey(sliderKey), const Offset(-50.0, 0.0));
       print("offset -50 $value");
       print("The timer refresh rate is $refreshrate ms");
       expect(value, equals(400.0));
       await tester.drag(find.byKey(sliderKey), const Offset(-30.0, 0.0));
       print("offset -30 $value");
       print("The timer refresh rate is $refreshrate ms");
       expect(value, equals(800.0));
       await tester.drag(find.byKey(sliderKey), const Offset(0.0, 0.0));
       print("offset 0 $value");
       print("The timer refresh rate is $refreshrate ms");
       expect(value, equals(1200.0));
       await tester.drag(find.byKey(sliderKey), const Offset(50.0, 0.0));
       print("offset 30 $value");
       print("The timer refresh rate is $refreshrate ms");
       expect(value, equals(1600.0));
       await tester.drag(find.byKey(sliderKey), const Offset(80.0, 0.0));
       print("offset 80 $value");
       print("The timer refresh rate is $refreshrate ms");
       expect(value, equals(2000.0));

      // Animation complete.

    }
    );
}