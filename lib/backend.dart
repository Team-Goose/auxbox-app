import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:spotify/spotify_io.dart';

class Backend {
  SpotifyApi spotify;

  Future<bool> init() async {
    
    var keyJson = await rootBundle.loadString('assets/authCodes.json');
    var keyMap = json.decode(keyJson);
    var credentials = new SpotifyApiCredentials(keyMap['id'], keyMap['secret']);
    spotify = new SpotifyApi(credentials);
    print(spotify.toString());
    return true;
  }

  Future<List<TrackSimple>> searchSong(String title, int limit) async {
    //print(spotify.toString());
    var song = TrackSimple();
    song.name = "empty";
    if (spotify == null) {
      return [song];
    }
    var search = await Search(spotify)
        .get(title)
        .first(limit)
        .catchError((err) => print((err).toString()));
    if (search == null) {
      return null;
    }
    return search.expand((pages) => pages.items).whereType<TrackSimple>().toList();
  }
}
