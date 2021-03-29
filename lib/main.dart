import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'api/pokemon_repository.dart';
import 'api/pokemon_api_client.dart';
import 'providers/list_provider.dart';
import 'ui/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ListProvider(
          PokemonRepository(PokemonApiClient(http.Client())),
        ),
        child: ListPage(),
      ),
    );
  }
}
