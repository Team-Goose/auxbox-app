import 'package:flutter/material.dart';
import 'backend.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Backend backend = Backend();
  List<Widget> songs = [];
  String title = "africa";
  final _textFieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    backend.init().then((sting) => _updateSongs());
    _updateSongs();
  }

  void _updateSongs() {
    backend.searchSong(title, 11).then((newSongs) {
      setState(() {
        songs = newSongs
            .map((song) => ListTile(
                  title: Text(song.name),
                  subtitle: Text(
                      song.artists.map((artist) => artist.name).toString()),
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
    var children = <Widget>[
      Form(
          key: _textFieldKey,
          child: TextFormField(
            onSaved: (string) => title = string,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Search"),
          )),
      RaisedButton(
          child: Text("Search"),
          onPressed: () {
            _textFieldKey.currentState.save();
            _updateSongs();
          }),
    ];
    children.addAll(songs);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: ListView(children: children),
    );
  }
}
