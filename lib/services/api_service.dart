import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/charackter.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  // get chars  by Charckter model
  Future<Character> getCharacter(int id) async {
    try {
      final response = await dio.get('character/$id');
      if (response.statusCode == 200) {
        return Character.fromJson(response.data);
      } else {
        throw Exception('Failed to load character');
      }
    } catch (e) {
      throw Exception('Failed to load character: $e');
    }
  }
}
