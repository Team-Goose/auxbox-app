import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:spotify/spotify_io.dart';

class Backend {
  SpotifyApi spotify;

  Future<String> init() async {
    return await rootBundle.loadString('assets/authCodes.json').then((string) { ;
    var keyMap = json.decode(string);
    var credentials = new SpotifyApiCredentials(keyMap['id'], keyMap['secret']);
    spotify = new SpotifyApi(credentials);
    });
  }

  Future<List<TrackSimple>> searchSong(String title, int limit) async {
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

  Future<List<dynamic>> getWifi() {
    
  }
}
