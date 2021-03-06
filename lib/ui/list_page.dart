import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/base_provider.dart';
import '../providers/list_provider.dart';
import '../res/app_colors.dart';
import '../res/app_strings.dart';
import '../ui/custom_progress_indicator.dart';
import '../ui/list_item.dart';

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
        title: const Text(AppStrings.title),
      ),
      body: _listProvider.state == ProviderState.Success
          ? _gridView()
          : CustomProgressIndicator(),
    );
  }

  Widget _gridView() {
    return RawScrollbar(
      thickness: 4,
      thumbColor: AppColors.primary,
      child: OrientationBuilder(
        builder: (context, orientation) {
          final itemsPerRow = orientation == Orientation.portrait ? 2 : 4;
          return GridView.builder(
            itemCount: _listProvider.pokemons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: itemsPerRow,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            padding: EdgeInsets.only(
              top: 8,
              right: 8,
              left: 8,
            ),
            itemBuilder: (context, int index) => ListItem(
              key: ObjectKey(index),
              pokemon: _listProvider.pokemons[index],
            ),
          );
        },
      ),
    );
  }
}
