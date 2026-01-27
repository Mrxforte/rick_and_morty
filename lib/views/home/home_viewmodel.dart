import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/app/locator.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/services/api_service.dart';

class HomeViewmodel extends ChangeNotifier {
  final apiservice = locator<ApiService>();
  Character? character;
  Future<void> getCharacter() async {
    character = await apiservice.getCharacters();
    notifyListeners();
  }
}
