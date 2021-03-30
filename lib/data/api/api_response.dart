import '../../model/pokemon.dart';

class ApiResponse {
  static List<Pokemon> mapToList(Map<String, dynamic> response) {
    try {
      final List<Pokemon> pokemons = [];
      for (Map<String, dynamic> json in response['results']) {
        pokemons.add(Pokemon.fromJson(json));
      }
      return pokemons;
    } catch (exception) {
      throw Exception('Invalid response: $exception');
    }
  }
}
