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
    super.initState();
    backend.init();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> songs;
    backend.searchSong("africa", 10).then((newSongs) {
      songs = newSongs
          .map((song) => ListTile(
                title: Text(song.name),
              ))
          .toList();
      songs = ListTile.divideTiles(
        context: context,
        tiles: songs,
      ).toList();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("AuxBox"),
        centerTitle: true,
      ),
      body: ListBody(
        children: songs,
      ),
    );
  }
}
