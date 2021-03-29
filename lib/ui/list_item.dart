import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/list_item_provider.dart';
import '../extensions/string_ext.dart';

class ListItem extends StatelessWidget {
  ListItem({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listItemProvider = Provider.of<ListItemProvider>(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      color: _listItemProvider.dominantColor,
      child: InkWell(
        enableFeedback: true,
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Image(image: _listItemProvider.image),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(_listItemProvider.pokemon.name.capitalize()),
              ),
            ],
          ),
        ),
        onTap: () => print('${_listItemProvider.pokemon.name} tapped!'),
      ),
    );
  }
}
