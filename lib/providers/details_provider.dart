import '../model/pokemon.dart';
import '../providers/base_provider.dart';
import '../repositories/pokemon_repository.dart';

class DetailsProvider extends BaseProvider {
  late Pokemon _pokemon;
  final PokemonRepository pokemonRepository;

  DetailsProvider({
    required this.pokemonRepository,
  });

  Pokemon get pokemon => _pokemon;

  void init(Pokemon pokemon) => _pokemon = pokemon;

  void fetchDetails() async {
    try {
      setState(ProviderState.Loading);
      _pokemon.details = await pokemonRepository.getPokemonDetails(_pokemon.id);
      setState(ProviderState.Success);
    } catch (exception) {
      print(exception);
      setState(ProviderState.Failure);
    }
  }
}
