import 'pokemon_form_model.dart';

class Pokemon {
  int id;
  String name;
  String frontDefaultSpriteUrl;
  List<String> types;
  int height;
  int weight;
  List<PokemonForm> forms;

  Pokemon({
    required this.id,
    required this.name,
    required this.frontDefaultSpriteUrl,
    required this.types,
    required this.height,
    required this.weight,
    required this.forms,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      frontDefaultSpriteUrl: json['sprites']['front_default'],
      types: json['types'].map((type) => type['name']).toList(),
      height: json['height'],
      weight: json['weight'],
      forms: json['forms'].map((form) => PokemonForm.fromJson(form)).toList(),
    );
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, frontDefaultSpriteUrl: $frontDefaultSpriteUrl, types: $types, height: $height, weight: $weight, forms: $forms)';
  }
}
