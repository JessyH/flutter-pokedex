import '../model/pokemon.dart';
import '../model/pokemon_details.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();

  Future<PokemonDetails> getPokemonDetails(int id);
}
