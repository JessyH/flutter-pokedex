import '../model/pokemon.dart';

class PokemonListResponse {
  final List<Pokemon> pokemons = [];

  PokemonListResponse(Map<String, dynamic> response) {
    try {
      for (int i = 0; i < response['results'].length; i++) {
        pokemons.add(Pokemon.fromJson(response['results'][i]));
      }
    } catch (exception) {
      throw Exception('Invalid response: $exception');
    }
  }
}
