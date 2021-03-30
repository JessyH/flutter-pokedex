import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../extensions/string_ext.dart';
import '../model/pokemon.dart';

class ListItem extends StatelessWidget {
  final Pokemon pokemon;

  ListItem({required Key key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      color: pokemon.dominantColor,
      child: InkWell(
        enableFeedback: true,
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CachedNetworkImage(imageUrl: pokemon.getImageUrl()),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(pokemon.name.capitalize()),
              ),
            ],
          ),
        ),
        onTap: () => print('${pokemon.name} tapped!'),
      ),
    );
  }
}
