import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          TextField(),
          ListView(
            children: <Widget>[
              
            ],
          )
        ],
      ),
    );
  }
}