import '../api/pokemon_repository.dart';
import '../model/pokemon.dart';
import '../providers/base_provider.dart';

class ListProvider extends BaseProvider {
  final List<Pokemon> _pokemons = [];
  final PokemonRepository pokemonRepository;

  ListProvider(this.pokemonRepository);

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
