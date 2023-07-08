// import 'pokemon_form_model.dart';

import 'package:flutter/material.dart';

class Pokemon {
  int id;
  String name;
  String sprite_url;
  String artwork_url;
  // List<String> types;
  int height;
  int weight;
  late Color mainColor;
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
      height: json['height'],
      weight: json['weight'],
    );
  }
}
