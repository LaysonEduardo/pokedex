import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AppColors {
  AppColors._();
  static Future<Color> pokemonColor(ImageProvider image) async {
    final palette = await PaletteGenerator.fromImageProvider(image);
    final paletteColor = palette.dominantColor;
    if (paletteColor != null) {
      return paletteColor.color;
    }
    throw Exception();
  }
}
