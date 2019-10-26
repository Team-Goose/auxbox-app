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
                // Navigator.push(context, route);
              },
            ),
            ListTile(
              title: Text("Settings"),
            )
          ],
        ),
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          
        }),
        child: Icon(Icons.search),
      ),
    );
  }
}