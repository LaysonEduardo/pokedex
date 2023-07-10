class PokemonSimple {
  String name;
  String url;

  PokemonSimple({required this.name, required this.url});

  factory PokemonSimple.fromJson(Map<String, dynamic> json) {
    return PokemonSimple(name: json['name'], url: json['url']);
  }
}
