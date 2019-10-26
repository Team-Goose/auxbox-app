import 'package:flutter/material.dart';


class Devices extends StatefulWidget {
  @override
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devices"),
        centerTitle: true,
      ),
      body: ListView(
        children: _getDevices(),
      ),
    );
  }
}

_getDevices() {
  var deviceList = <Widget>[];
  return deviceList;
}