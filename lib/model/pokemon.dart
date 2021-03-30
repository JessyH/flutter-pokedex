import 'package:flutter/material.dart';

import 'pokemon_details.dart';
import '../extensions/string_ext.dart';

class Pokemon {
  late final int id;
  final String name;
  final String url;
  PokemonDetails? details;
  Color dominantColor = defaultDominantColor;

  static const Color defaultDominantColor = Colors.white;

  Pokemon({
    required this.name,
    required this.url,
  }) {
    int? idFromUrl = RegExp('[^/]+(?=[\\/]\$|\$)').stringMatch(url)?.parseInt();
    if (idFromUrl == null) {
      throw Exception('Invalid id parsed from url: $url');
    }
    this.id = idFromUrl;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      Pokemon(name: json['name'], url: json['url']);

  String getImageUrl() =>
      'https://pokeres.bastionbot.org/images/pokemon/$id.png';
}
