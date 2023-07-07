import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:palette_generator/palette_generator.dart';
// import 'pokemon_form_model.dart';

@JsonSerializable()
class Pokemon {
  int id;
  String name;
  String sprite_url;
  String artwork_url;
  // List<String> types;
  int height;
  int weight;
  PaletteColor? dominant_color;
  Image? image_provider;
  Pokemon({
    required this.id,
    required this.name,
    required this.sprite_url,
    required this.artwork_url,
    // required this.types,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      sprite_url: json['sprites']['front_default'],
      artwork_url: json['sprites']['other']['official-artwork']
          ['front_default'],
      // types: List<String>.from(json['types']),
      height: json['height'],
      weight: json['weight'],
    );
  }
}
