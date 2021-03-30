import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/api/pokemon_api_client.dart';
import 'data/pokemon_repository_impl.dart';
import 'providers/list_provider.dart';
import 'repositories/pokemon_repository.dart';

final getIt = GetIt.instance;

void setup() {
  // Providers
  getIt.registerFactory(
    () => ListProvider(pokemonRepository: getIt()),
  );

  // Data
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(pokemonApiClient: getIt()),
  );
  getIt.registerLazySingleton(
    () => PokemonApiClient(httpClient: getIt()),
  );

  // External
  getIt.registerLazySingleton(() => http.Client());
}
