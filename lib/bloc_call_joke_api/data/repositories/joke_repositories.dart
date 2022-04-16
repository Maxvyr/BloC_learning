import 'package:dio/dio.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/data/models/joke_model.dart';

class JokeRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future<JokeModel> getJoke() async {
    final response = await Dio().getUri(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return jokeModelFromJson(response.data);
    } else {
      throw Exception("Failed to load joke");
    }
  }
}
