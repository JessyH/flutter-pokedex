import '../model/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();

  Future<Pokemon> getPokemonDetails(int id);
}
