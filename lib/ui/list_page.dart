import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../extensions/string_ext.dart';
import '../model/pokemon.dart';
import '../providers/base_provider.dart';
import '../providers/list_provider.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late ListProvider _listProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<ListProvider>(context, listen: false).fetchPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    _listProvider = Provider.of<ListProvider>(context, listen: true);

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
      itemBuilder: (BuildContext context, int index) =>
          _gridItem(pokemons[index]),
    );
  }

  Widget _gridItem(Pokemon pokemon) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: InkWell(
        enableFeedback: true,
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Image.network(
                    pokemon.getImageUrl(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(pokemon.name.capitalize()),
              ),
            ],
          ),
        ),
        onTap: () => _onGridItemTapped(pokemon),
      ),
    );
  }

  Widget _progressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _onGridItemTapped(Pokemon pokemon) {
    print('${pokemon.name} tapped!');
  }
}
