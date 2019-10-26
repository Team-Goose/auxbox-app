import 'package:auxbox/devices.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text("AuxBox"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("AuxBox"),
            ),
            ListTile(
              title: Text("Devices"),
              onTap: () {
                Navigator.pushNamed(context, '/devices');
              },
            ),
            ListTile(
              title: Text("Settings"),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text("Set up"),
              onTap: () {
                Navigator.pushNamed(context, '/setup');
              },
            ),
          ],
        ),
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.pushNamed(context, '/search');
        }),
        child: Icon(Icons.search),
      ),
    );
  }
}