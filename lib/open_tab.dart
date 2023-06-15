import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

void launchURL(BuildContext context) async {
  try {
    launch('https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
        )
    );
  }
  catch(e) {
    debugPrint(e.toString());
  }
}