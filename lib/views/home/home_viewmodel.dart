import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/app/locator.dart';
import 'package:rick_and_morty/models/character.dart';
import 'package:rick_and_morty/services/api_service.dart';

class HomeViewmodel extends ChangeNotifier {
  final apiservice = locator<ApiService>();
  Character? _character;
  Character? get character => _character;
  Future<void> getCharacter() async {
    _character = await apiservice.getCharacters();
    notifyListeners();
  }
}
