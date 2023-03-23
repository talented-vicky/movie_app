import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MovieService {
  static const _authority = "online-movie-database.p.rapidapi.com";
  // static const _authority = "sameer-kumar-aztro-v1.p.rapidapi.com";
  static const _path = "/";
  static const _query = {"sign": "aquarius", "day": "today"};
  static const Map<String, String> _headers = {
    "x-rapidapi-key": "4c1bdd2f65msha061590ecef1ee6p1bb40bjsn46fdc2a8d8ac",
    "x-rapidapi-host": _authority,
    'Content-Type': 'application/json' // just added this
  };

  // Future<List<MovieData>>? getMovie() async {
  Future<MovieData> getMovie() async {
    Uri uri = Uri.https(_authority, _path, _query);
    final res = await http.get(uri, headers: _headers);

    if (res.statusCode == HttpStatus.ok) {
      // If server returns an OK response, parse the JSON.
      final jsonMap = json.decode(res.body);
      return MovieData.fromJson(jsonMap);
    } else {
      // If that response was not OK, throw an error.
      throw Exception(
          'API call returned: ${res.statusCode} ${res.reasonPhrase}');
    }
  }
}
