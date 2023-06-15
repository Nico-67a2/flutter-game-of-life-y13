import 'package:flutter/material.dart';

// I have created a globals file so that variables used across the application
// can be found easily

// refreshrate is the dynamic refresh rate - this value changes when the user moves
// the slider.
int refreshrate = 2200;

// startingmilliseconds is used to set the original refresh rate the app will use
// when the app starts but it is also used to calculate refresh rate changes
int startingmilliseconds = 2200;

// set the starting color of cells
var cellsColor = Color.fromARGB(255, 55, 242, 158);
