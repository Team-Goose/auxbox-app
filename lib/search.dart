import 'package:flutter/material.dart';
import 'package:spotify/spotify_io.dart';
import 'backend.dart';

class Track {
  TrackSimple track;
  bool added = false;
  Track(this.track);
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Backend backend = Backend();
  List<Track> songs = [];
  String title = "africa";
  final _textFieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    backend.init().then((string) => _updateSongs());
  }

  void _updateSongs() {
    backend.searchSong(title, 11).then((newSongs) {
      setState(() {
        songs = newSongs.map((track) => Track(track)).toList();
      });
    });
  }

  List<Widget> getSongWidgets() {
    List<Widget> newSongs = songs
        .map(
          (song) => ListTile(
            title: Text(song.track.name),
            trailing: Icon(song.added ? Icons.check : Icons.add),
            onTap: () {setState(() {
              song.added = true;
              backend.addToPlaylist(song.track.id);
            });},
            subtitle: Text(
                song.track.artists.map((artist) => artist.name).toString()),
          ),
        )
        .toList();
    newSongs = ListTile.divideTiles(
      context: context,
      tiles: newSongs,
    ).toList();
    return newSongs;
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      Form(
          key: _textFieldKey,
          child: TextFormField(
            onSaved: (string) => title = string,
            decoration: InputDecoration(
              labelText: "Search"),
          )),
      RaisedButton(
          child: Text("Search"),
          onPressed: () {
            _textFieldKey.currentState.save();
            _updateSongs();
          }),
    ];
    children.addAll(getSongWidgets());
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: ListView(children: children),
    );
  }
}
