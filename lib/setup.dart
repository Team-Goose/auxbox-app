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

_setUpSteps() async {
  var listAvailableWifi = WifiConfiguration.getWifiList();
  
}

_setupStepController() {
  bool step1 = false;
  bool step2 = false;
  bool step3 = false;
  
  _setUpSteps();

  return Container(child: ListView(
    children: <Widget>[
      Card(child: ListTile(
        title: Text("Step 1: Plug in your AuxBox and keep your phone nearby"),
        trailing: Icon(step1 ? Icons.check : Icons.clear),
      )),
      Card(child: ListTile(
        title: Text("Step 2: Select a Wifi network to connect your AuxBox to"),
        trailing: Icon(step2 ? Icons.check : Icons.clear),
      )),
      Card(child: ListTile(
        title: Text("Step 3: Log into Spotify"),
        trailing: Icon(step3 ? Icons.check : Icons.clear),
      )),
    ],
  ),
  margin: EdgeInsets.all(8.0),
  );
}