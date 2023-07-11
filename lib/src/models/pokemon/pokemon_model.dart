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
  double weight;
  List<String> abilities;
  late Color mainColor;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprite_url,
    required this.artwork_url,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<PokemonType> fetchedTypes = [];
    List<String> fetchedAbilities = [];

    for (Map value in json['types']) {
      fetchedTypes.addAll(PokemonType.values
          .where((element) => element.name == value['type']['name']));
    }

    for (var value in json['abilities']) {
      fetchedAbilities.add(value['ability']['name']);
    }

    return Pokemon(
        id: json['id'],
        name: AppStrings.removeGenderString(json['name']),
        sprite_url: json['sprites']['front_default'],
        artwork_url: json['sprites']['other']['official-artwork']
            ['front_default'],
        //Multiplicacion to convert decimetres to cm
        height: json['height'] * 10,
        //Division to convert weight from hectograms to kilograms
        weight: json['weight'] / 10,
        types: fetchedTypes,
        abilities: fetchedAbilities);
  }
}
