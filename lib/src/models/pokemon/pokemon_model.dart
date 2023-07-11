import 'package:flutter/material.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';
import 'package:pokedex_colaboraapp/src/utils/poke_types.dart';

class Pokemon {
  int id;
  String name;
  String sprite_url;
  String artwork_url;
  List<PokemonType> types;
  int height;
  int weight;
  late Color mainColor;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite_url,
    required this.artwork_url,
    required this.types,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<PokemonType> fetchedTypes = [];

    for (Map value in json["types"]) {
      fetchedTypes.addAll(PokemonType.values
          .where((element) => element.name == value["type"]["name"]));
    }

    return Pokemon(
      id: json['id'],
      name: AppStrings.removeGenderString(json['name']),
      sprite_url: json['sprites']['front_default'],
      artwork_url: json['sprites']['other']['official-artwork']
          ['front_default'],
      height: json['height'],
      weight: json['weight'],
      types: fetchedTypes,
    );
  }
}
