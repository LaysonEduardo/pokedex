import 'package:pokedex_colaboraapp/src/utils/poke_types.dart';

final class Endpoints {
  Endpoints._();
  static const String baseURL = 'https://pokeapi.co/api/v2';

  static String pokemonByID(int id) {
    return "$baseURL/pokemon/$id";
  }

  static String pokemonsList({int limit = 0, int offset = 0}) {
    return "$baseURL/pokemon?limit=$limit&offset=$offset";
  }

  static String pokemonsByType(PokemonType type) {
    return "$baseURL/type/${type.name}";
  }
}
