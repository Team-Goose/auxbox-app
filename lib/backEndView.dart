import 'package:flutter/material.dart';
import 'backend.dart';

class BackEndView extends StatefulWidget {
  @override
  BackEndViewState createState() => BackEndViewState();
}

class BackEndViewState extends State<BackEndView> {
  Backend backend = Backend();
  List<Widget> songs = [];

  @override
  void initState() {
    super.initState();
    backend.init().then((sting) =>updateSongs());
    updateSongs();
  }

  void updateSongs() {
    backend.searchSong("africa", 11).then((newSongs) {
      setState(() {
         songs = newSongs
            .map((song) => ListTile(
                  title: Text(song.name),
                  subtitle: Text(song.artists.map((artist) => artist.name).toString()),
                ))
            .toList();
        songs = ListTile.divideTiles(
          context: context,
          tiles: songs,
        ).toList();
        print(songs);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AuxBox"),
        centerTitle: true,
      ),
      body: ListView(
        children: songs,
      ),
    );
  }
}
