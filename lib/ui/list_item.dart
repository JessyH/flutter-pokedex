import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'details_page.dart';
import '../dependency_injection.dart' as di;
import '../extensions/string_ext.dart';
import '../model/pokemon.dart';
import '../providers/details_provider.dart';

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
                child: Text(
                  pokemon.name.capitalize(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (_) => di.getIt<DetailsProvider>()..init(pokemon),
                child: DetailsPage(),
              ),
            ),
          ),
        },
      ),
    );
  }
}
