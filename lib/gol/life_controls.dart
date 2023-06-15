import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:game_of_life/gol/gol.dart';
import 'package:game_of_life/gol/color_picker.dart';
import 'package:game_of_life/gol/globals.dart';
import 'package:game_of_life/open_tab.dart';

class LifeControls extends StatefulWidget {
  const LifeControls({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final LifeController controller;

  @override
  State<LifeControls> createState() => _LifeControlsState();
}

class _LifeControlsState extends State<LifeControls> {
  int ticks = 0;
  int _value = 0;

  @override
  void initState() {
    ticks = 0;
    widget.controller.addListener(() => {
          setState(() {
            ticks++;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () =>
                {
                  widget.controller.timer.isActive
                      ? widget.controller.interruptTimer()
                      : widget.controller.startTimer(refreshrate)
                },
                icon: Icon(widget.controller.timer.isActive
                    ? Icons.stop
                    : Icons.play_arrow),
                label:
                Text(widget.controller.timer.isActive ? 'STOP' : 'START'),
                key: Key('start_stop'),
              ),
              TextButton.icon(
                onPressed: () => widget.controller.clear(),
                icon: const Icon(Icons.clear),
                label: const Text('CLEAR'),
                key: Key('clear'),
              ),
              TextButton.icon(
                onPressed: () {
                  // we need to determine if the program is running on a mobile or on the web using the
                  // kIsWeb function - this return boolean
                  if (kIsWeb) {
                    // true is returned - running on web
                    showDialog<String>(
                      // show a dialog box
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Feature Not Supported'),
                        content: const Text(
                            'This button only works in apps and not in browser version of this game'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // NOT running on the web! You can check for additional platforms here.
                    exit(0);
                  }
                },
                icon: const Icon(Icons.exit_to_app),
                label: const Text('EXIT'),
                key: Key('exit'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.assist_walker),
              Slider(
                min: 0.0,
                max: 2000.0,
                // get the value from the slider position - convert to double
                value: _value.toDouble(),
                divisions: 5,
                // set the value only when the slider moves
                onChanged: (value) {
                  setState(() {
                    _value = value.toInt();
                    // update the refresh rate
                    refreshrate = startingmilliseconds - _value;
                    // stop the painter
                    widget.controller.interruptTimer();
                    // restart the painter using the new refresh rate
                    widget.controller.startTimer(refreshrate);
                  });
                },
              ),
              Icon(Icons.directions_run),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            // draw color picker - implemented in color_picker.dart
            ColorPicker(300)
          ]),
          Center(
            child: TextButton(
              // this button opens a browser that goes to wiki page
              child: const Text('About Conways Game of Life',
                  style: TextStyle(fontSize: 15)),
              onPressed: () => launchURL(context),
            ),
          ),
        ],
      ),
    );
  }
}
