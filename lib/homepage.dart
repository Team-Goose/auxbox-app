import 'package:auxbox/backend.dart';
import 'package:auxbox/devices.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify_io.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Backend backend = Backend();
  List<Widget> queue = [];

  @override
  void initState() {
    super.initState();
    backend.init().then((string) => _updateCurrentPlaylist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _updateCurrentPlaylist();
            },
          )
        ],
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
      body: ListView(
        children: queue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          Navigator.pushNamed(context, '/search');
        }),
        child: Icon(Icons.search),
      ),
    );
  }

  void _updateCurrentPlaylist() {
    backend.getCurrentPlaylist().then((playlist) {
      setState(() {
        queue = (playlist as Playlist).songs.map((song) {
          ListTile(title: Text(song.name), subtitle: Text(song.artists.toString()),);
        }).toList();
      });
    });
  }
}

class Playlist {
  List<Song> songs;
  Playlist(this.songs);
}

class Song {
  String name;
  List<String> artists;
  Song(this.name, this.artists);
}
