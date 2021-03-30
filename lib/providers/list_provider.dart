import '../model/pokemon.dart';
import '../providers/base_provider.dart';
import '../repositories/pokemon_repository.dart';

class ListProvider extends BaseProvider {
  final List<Pokemon> _pokemons = [];
  final PokemonRepository pokemonRepository;

  ListProvider({required this.pokemonRepository});

  List<Pokemon> get pokemons => _pokemons;

  void fetchPokemons() async {
    try {
      setState(ProviderState.Loading);
      _pokemons.clear();
      _pokemons.addAll(await pokemonRepository.getPokemons());
      setState(ProviderState.Success);
    } catch (exception) {
      print(exception);
      setState(ProviderState.Failure);
    }
  }
}
