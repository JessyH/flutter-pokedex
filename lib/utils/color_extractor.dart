import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/pokemon.dart';

class ColorExtractor {
  Future<Color> getDominantColor(ImageProvider imageProvider) async {
    final generator = await PaletteGenerator.fromImageProvider(imageProvider);
    return generator.dominantColor?.color ?? Pokemon.defaultDominantColor;
  }
}
