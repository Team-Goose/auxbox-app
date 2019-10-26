import 'package:flutter/material.dart';

class Wifi extends StatefulWidget {
  @override
  _WifiState createState() => _WifiState();
}

class _WifiState extends State<Wifi> {

  List<Widget> networks;

  Future _getNetworks() async {
    List<Widget> networkList = [];

    // API CALL HERE



    setState(() {
      networks = networkList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wifi"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getNetworks();
            },
          )
        ],
      ),
      body: ListView(
        children: networks,
      ),
    );
  }
}