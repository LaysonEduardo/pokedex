import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AppColors {
  AppColors._();

  static Future<Color> pokemonBaseColor(ImageProvider image) async {
    final palette = await PaletteGenerator.fromImageProvider(image);
    final paletteColor = palette.dominantColor;
    if (paletteColor != null) {
      return paletteColor.color;
    }
    throw Exception();
  }

  static Future<Color> pokemonMainColor(ImageProvider image) async {
    final palette = await PaletteGenerator.fromImageProvider(image);
    final paletteColor = palette.mutedColor ?? palette.dominantColor;

    if (paletteColor != null) {
      return paletteColor.color.withSaturation(0.7);
    }
    throw Exception();
  }

  static typeColor() async {
    // return Color(Colors.red);
  }
}

extension ColorWithHSL on Color {
  HSLColor get hsl => HSLColor.fromColor(this);

  Color withSaturation(double saturation) {
    return hsl.withSaturation(clampDouble(saturation, 0.0, 1.0)).toColor();
  }

  Color withLightness(double lightness) {
    return hsl.withLightness(clampDouble(lightness, 0.0, 1.0)).toColor();
  }

  Color withHue(double hue) {
    return hsl.withHue(clampDouble(hue, 0.0, 360.0)).toColor();
  }
}
