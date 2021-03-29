import '../api/pokemon_api_client.dart';
import '../model/pokemon.dart';

class PokemonRepository {
  final PokemonApiClient pokemonApiClient;

  PokemonRepository(this.pokemonApiClient);

  Future<List<Pokemon>> getPokemons() async =>
      pokemonApiClient.getFirstGeneration();
}
