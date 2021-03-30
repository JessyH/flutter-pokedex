import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_response.dart';
import '../../model/pokemon.dart';

class PokemonApiClient {
  static const _uriAuthority = 'pokeapi.co';
  static const _uriPath = 'api/v2/pokemon';

  final http.Client httpClient;

  PokemonApiClient({required this.httpClient});

  Future<List<Pokemon>> getFirstGeneration() async {
    final http.Response response = await _safeGet(
      Uri.https(_uriAuthority, _uriPath, {'limit': '8'}),
      'Failed to get the first generation of Pokemons',
    );
    return ApiResponse.mapToList(json.decode(response.body));
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
