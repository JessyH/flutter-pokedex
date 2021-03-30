import 'package:cached_network_image/cached_network_image.dart';

import 'api/pokemon_api_client.dart';
import '../model/pokemon.dart';
import '../repositories/pokemon_repository.dart';
import '../utils/color_extractor.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonApiClient pokemonApiClient;
  final colorExtractor = ColorExtractor();

  PokemonRepositoryImpl({required this.pokemonApiClient});

  @override
  Future<Pokemon> getPokemonDetails(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Pokemon>> getPokemons() async {
    final pokemons = await pokemonApiClient.getFirstGeneration();
    for (Pokemon pokemon in pokemons) {
      // TODO could/should be done in the Pokemon model, adding an 'init' method to create the id, set the dominant color, etc.
      // WARNING: intensive operation !
      pokemon.dominantColor = await colorExtractor.getDominantColor(
        CachedNetworkImageProvider(pokemon.getImageUrl()),
      );
    }
    return pokemons;
  }
}
