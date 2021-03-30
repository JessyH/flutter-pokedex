import '../model/pokemon.dart';

class PokemonListResponse {
  final List<Pokemon> pokemons = [];

  PokemonListResponse(Map<String, dynamic> response) {
    try {
      for (Map<String, dynamic> json in response['results']) {
        pokemons.add(Pokemon.fromJson(json));
      }
    } catch (exception) {
      throw Exception('Invalid response: $exception');
    }
  }
}
