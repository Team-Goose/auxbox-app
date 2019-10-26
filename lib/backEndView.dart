import 'package:flutter/material.dart';
import 'backend.dart';

class backEndView extends StatefulWidget {
  @override
  backEndView_State createState() => backEndView_State();
}

class backEndView_State extends State<backEndView> {
  Backend backend = Backend();

  @override
  void initState() {
    backend.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var songs;
    return Scaffold(
      appBar: AppBar(
         title: const Text("AuxBox"),
        centerTitle: true,
      ),
      body: ListBody(
        
      ),
    );
  }
}