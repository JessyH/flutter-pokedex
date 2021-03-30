import 'api/pokemon_api_client.dart';
import '../model/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonApiClient pokemonApiClient;

  PokemonRepositoryImpl({required this.pokemonApiClient});

  @override
  Future<Pokemon> getPokemonDetails(int id) => throw UnimplementedError();

  @override
  Future<List<Pokemon>> getPokemons() => pokemonApiClient.getFirstGeneration();
}
