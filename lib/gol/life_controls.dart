import 'dart:io';

import 'package:flutter/material.dart';
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
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () => {
                      widget.controller.timer.isActive
                          ? widget.controller.interruptTimer()
                          : widget.controller.startTimer(refreshrate)
                    },
                    icon: Icon(widget.controller.timer.isActive
                        ? Icons.stop
                        : Icons.play_arrow),
                    label: Text(
                        widget.controller.timer.isActive ? 'STOP' : 'START'),
                  ),
                  TextButton.icon(
                    onPressed: () => widget.controller.clear(),
                    icon: const Icon(Icons.clear),
                    label: const Text('CLEAR'),
                  ),
                  TextButton.icon(
                    onPressed: () => exit(0),
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text('EXIT'),
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
                    value: _value.toDouble(),
                    divisions: 5,
               // use label to see the value that will be added to starting_milliseconds
               //     label: _value.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _value = value.toInt();
                        refreshrate = startingmilliseconds - _value;
                        widget.controller.interruptTimer();
                        widget.controller.startTimer(refreshrate);
                      });
                    },
                  ),
                  Icon(Icons.directions_run),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ColorPicker(300)
                ]
              ),
              Center(
                child: TextButton(
                  child: const Text('About Conways Game of Life', style: TextStyle(fontSize: 15)),
                  onPressed: () => launchURL(context),
                ),
              ),
            ],
          ),
        );
  }
}
