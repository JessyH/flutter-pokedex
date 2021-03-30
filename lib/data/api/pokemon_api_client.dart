import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_response.dart';
import '../../model/pokemon.dart';
import '../../model/pokemon_details.dart';

class PokemonApiClient {
  static const _uriAuthority = 'pokeapi.co';
  static const _uriPath = 'api/v2/pokemon';

  final http.Client httpClient;

  PokemonApiClient({required this.httpClient});

  Future<List<Pokemon>> getFirstGeneration() async {
    final http.Response response = await _safeGet(
      Uri.https(_uriAuthority, _uriPath, {'limit': '12'}),
      'Failed to get the first generation of Pokemons',
    );
    return ApiResponse.mapToPokemonList(json.decode(response.body));
  }

  Future<PokemonDetails> getDetails(int id) async {
    final http.Response response = await _safeGet(
      Uri.https(_uriAuthority, '$_uriPath/$id'),
      'Failed to get the details of Pokemon with id: $id',
    );
    return ApiResponse.mapToPokemonDetails(json.decode(response.body));
  }

  Future<http.Response> _safeGet(Uri uri, String error) async {
    final response = await httpClient.get(uri);
    if (response.statusCode != 200) {
      throw Exception(error);
    }
    print('--- _safeGet: ${uri.path}, status: ${response.statusCode}');
    return response;
  }
}
