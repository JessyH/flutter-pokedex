import '../../model/pokemon.dart';
import '../../model/pokemon_details.dart';

class ApiResponse {
  static List<Pokemon> mapToPokemonList(Map<String, dynamic> response) {
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

  static PokemonDetails mapToPokemonDetails(Map<String, dynamic> response) {
    try {
      return PokemonDetails.fromJson(response);
    } catch (exception) {
      throw Exception('Invalid response: $exception');
    }
  }
}
