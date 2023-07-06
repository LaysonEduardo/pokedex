import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PokemonForm {
  String name;
  String url;

  PokemonForm({
    required this.name,
    required this.url,
  });

  factory PokemonForm.fromJson(Map<String, dynamic> json) {
    return PokemonForm(
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  String toString() {
    return 'PokemonForm(name: $name, url: $url)';
  }
}
