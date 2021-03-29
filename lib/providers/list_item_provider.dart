import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/pokemon.dart';

class ListItemProvider extends ChangeNotifier {
  final Pokemon _pokemon;
  late CachedNetworkImageProvider _image;
  PaletteGenerator? _paletteGenerator;

  ListItemProvider(this._pokemon) {
    _image = CachedNetworkImageProvider(_pokemon.getImageUrl());
    _updatePaletteGenerator();
  }

  Pokemon get pokemon => _pokemon;

  ImageProvider get image => _image;

  Color get dominantColor =>
      _paletteGenerator?.dominantColor?.color ?? Colors.grey;

  Future<void> _updatePaletteGenerator() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(_image);
    notifyListeners();
  }
}
