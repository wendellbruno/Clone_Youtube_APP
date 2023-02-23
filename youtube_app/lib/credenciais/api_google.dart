import 'package:http/http.dart' as http;
import 'dart:convert';

const  CHAVE_YT_API = "AIzaSyD2a5dBqo0lWfVEqxMVzh8QUtfwOsgLgRA";
const  ID_CHANEL = "UCetYSRBCjgFVy8keH3Lz7UQ";
const  URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<Map?> _pesquisa(String pesquisa) async{
    try{
      const request = "${URL_BASE}search?part=snippet&type=video&maxResults=20&order=data&key=$CHAVE_YT_API&channelId=$ID_CHANEL";
      final response = await http.get(Uri.parse(request));
      if(response.statusCode == 200){
      //return json.decode(response.body);
      print(response.body);
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }
}