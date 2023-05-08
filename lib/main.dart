import 'package:flutter/material.dart';
import 'package:game_of_life/gol/gol.dart';
import 'package:game_of_life/gol/globals.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      // Provide the model to all widgets within the app. We're using
      // ChangeNotifierProvider because that's a simple way to rebuild
      // widgets when a model changes. We could also just use
      // Provider, but then we would have to listen to Counter ourselves.
      //
      // Read Provider's docs to learn about all the available providers.
      ChangeNotifierProvider(
        // Initialize the model in the builder. That way, Provider
        // can own Counter's lifecycle, making sure to call `dispose`
        // when not needed anymore.
          create: (context) => RefreshRate(),
          child: MyApp()
      )
  );
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
