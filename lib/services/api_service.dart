import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rick_and_morty/models/character.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: "https://rickandmortyapi.com/api"));

  Future<Character> getCharacters() async {
    try {
      final response = await dio.get("/character");
      return Character.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
