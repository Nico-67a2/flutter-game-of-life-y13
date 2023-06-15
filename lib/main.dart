import 'package:flutter/material.dart';
import 'package:game_of_life/gol/gol.dart';

// This code was modified from original to complete Y13 Computer Science Project
// The original project comes with an open source license that allows me to use
// the code and modify the code without any costs or restrictions

// I had added a number of new controllers to enhance the user experience
// I added a color picker - this allows users to use a slider to choose a
// color that the cells will be displayed in.
// The color picker was created with help from a medium article
// https://medium.com/@mhstoller.it/how-i-made-a-custom-color-picker-slider-using-flutter-and-dart-e2350ec693a1

// I also added a slider that allowed the user to change the refresh rate for cell
// generation and cell death.

// I wanted to show users more information about conway's game of life, so I created a function
// that opened a browser on the wiki page about conways game


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game of life',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            primary: Colors.greenAccent,
          )),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: GameOfLife(
                cellSize: 14,
                hideControls: false,
//                cellsColor: Colors.greenAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
