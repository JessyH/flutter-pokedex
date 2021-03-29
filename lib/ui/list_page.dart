import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/pokemon.dart';
import '../providers/base_provider.dart';
import '../providers/list_provider.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<ListProvider>(context, listen: false).fetchPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listProvider = Provider.of<ListProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: _listProvider.state == ProviderState.Success
          ? _gridView(_listProvider.pokemons)
          : _progressIndicator(),
    );
  }

  Widget _gridView(List<Pokemon> pokemons) {
    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: GridTile(
            child: Text(pokemons[index].name),
          ),
        );
      },
    );
  }

  Widget _progressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
