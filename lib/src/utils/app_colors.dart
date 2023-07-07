import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AppColors {
  Future<PaletteColor> pokemonColor(ImageProvider image) async {
    final palette = await PaletteGenerator.fromImageProvider(image);
    final color = palette.dominantColor;
    if (color != null) {
      return color;
    }
    throw Exception();
  }
}
