import 'package:flutter/material.dart';

import 'package:wifi_configuration/wifi_configuration.dart';

class Setup extends StatefulWidget {
  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  _setupStepController(BuildContext context ) {
    bool step1 = false;
    bool step2 = false;
    bool step3 = false;
    
    _setUpSteps();

    return Container(child: ListView(
      children: <Widget>[
        Card(child: ListTile(
          title: Text("Plug in your AuxBox and keep your phone nearby"),
          trailing: Icon(step1 ? Icons.check : Icons.clear),
        )),
        Card(child: ListTile(
          title: RaisedButton(
            child: Text("Select a Wifi network use"),
            onPressed: () {
              Navigator.pushNamed(context, '/wifi');
            },
          ),
          trailing: Icon(step2 ? Icons.check : Icons.clear),
        )),
        Card(child: ListTile(
          title: RaisedButton(
            child: Text("Log in to Spotify"),
            onPressed: (){
              setState(() {
                step3 = true;
                Navigator.pushNamed(context, '/login');
              });
          },),
          trailing: Icon(step3 ? Icons.check : Icons.clear),
        )),
      ],
    ),
    margin: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set up a new device"),
        centerTitle: true,
      ),
      body: _setupStepController(context),
    );
  }
}

_setUpSteps() async {
  var listAvailableWifi = WifiConfiguration.getWifiList();
  
}

