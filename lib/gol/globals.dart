import 'package:flutter/material.dart';

class RefreshRate extends ChangeNotifier {
  int refreshrate = 2200;
  int startingmilliseconds = 2200;

  void update(int value) {
    refreshrate = startingmilliseconds - value;
    print("The value to subtract  $value");
    print("The resulting refresh rate $refreshrate");
    notifyListeners();
  }

  }

var cellsColor = Color.fromARGB(255, 55, 242, 158);