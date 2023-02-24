import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_app/models/video.dart';

const CHAVE_YT_API = "AIzaSyD2a5dBqo0lWfVEqxMVzh8QUtfwOsgLgRA";
const ID_CHANEL = "UCetYSRBCjgFVy8keH3Lz7UQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>?> pesquisa() async {
    try {
      const request =
          "${URL_BASE}search?part=snippet&type=video&maxResults=20&order=date&key=$CHAVE_YT_API";

      final response = await http.get(Uri.parse(request));

      if (response.statusCode == 200) {
        Map<String, dynamic> dadosJson = json.decode(response.body);
        List<Video> videos = dadosJson["items"].map<Video>((map) {
          return Video.fromJson(map);
        }).toList();
        return videos;
      } else {
        print('nao achado');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
