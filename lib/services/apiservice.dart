import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:trailertime/models/nowplayingmovie.dart';
import 'package:trailertime/models/searchmodel.dart';
import 'package:trailertime/models/top_rated.dart';
import 'package:trailertime/models/upcomingmoviemodel.dart';
import 'package:trailertime/utils/utils.dart';

const baseurl = "https://api.themoviedb.org/3/";
late String? endpoint;
var key = '?api_key=$api_key';

class Apiservice {
  Future<Upcomingmoviemodel> getupcomingmovie() async {
    endpoint = "movie/upcoming";
    final url = '$baseurl$endpoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("succes");
      return Upcomingmoviemodel.fromJson(jsonDecode(response.body));
    }
    throw Exception("failed to load Upcoming movie");
  }

  Future<Nowplaying> getnowplayingmovie() async {
    endpoint = "movie/now_playing";
    final url = "$baseurl$endpoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("succes");
      return Nowplaying.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load Now playing Movie");
    }
  }

  Future<TopRated> gettopratedmovie() async {
    endpoint = "movie/top_rated";
    final url = "$baseurl$endpoint$key";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("succes");
      return TopRated.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load top rated Movie");
    }
  }

  Future<Searchmodel> getsearchmovie(String searchedtext) async {
    endpoint = "search/movie?query=$searchedtext";
    final url = "$baseurl$endpoint";

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZDIwNjdkNTM3NDU1ZmE4MjI2MzBhMmZiOWI0NDM4NyIsIm5iZiI6MTcyNzg1Mjc5NS4yNTE0MDUsInN1YiI6IjY2ZGU1MGIyNWMwN2M4YjE3NWVjODkxMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.33MEEdt5NBnh7ZbcpBlAtHzynhhfaJxC0hVh8n9WF9k'
    });
    if (response.statusCode == 200) {
      log("succes");
      return Searchmodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load top rated Movie");
    }
  }
}
