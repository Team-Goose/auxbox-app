import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:spotify/spotify_io.dart';

class Backend {
  var spotify;

  void init() async {
    var keyJson = await rootBundle.loadString('assets/authCodes');
    var keyMap = json.decode(keyJson);
    var credentials = new SpotifyApiCredentials(keyMap['id'], keyMap['secret']);
    spotify = new SpotifyApi(credentials);
  }

  Future<List<Track>> searchSong(String title, int limit) async {
    var search = await Search(spotify)
        .get(title)
        .first(limit)
        .catchError((err) => print((err as SpotifyException).message));
    if (search == null) {
      return null;
    }
    return search.expand((pages) => pages.items).whereType<TrackSimple>().toList();
  }
}
