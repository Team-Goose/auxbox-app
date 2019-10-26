import 'package:flutter/material.dart';

import 'package:wifi_configuration/wifi_configuration.dart';

class Setup extends StatefulWidget {
  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set up a new device"),
        centerTitle: true,
      ),
      body: _setupStepController(),
    );
  }
}

_setupStepController() {
  return Row(
    children: <Widget>[
      Spacer(),
      Center(child: Text("To set up your AuxBox, please turn it on and connect to the AuxBox WiFi network on your phone.")),
      Center(child: Text("Your current wifi network is: "),),
      Spacer(),
    ]
  );
}