import 'package:auxbox/backEndView.dart';
import 'package:auxbox/devices.dart';
import 'package:auxbox/homepage.dart';
import 'package:auxbox/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: backEndView(),
      routes: <String, WidgetBuilder> {
        '/devices': (BuildContext context) => Devices(),
        '/settings': (BuildContext context) => Settings(),
      },
    );
  }
}