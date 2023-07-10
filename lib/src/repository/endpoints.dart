final class Endpoints {
  Endpoints._();
  static const String baseURL = 'https://pokeapi.co/api/v2';

  static String pokemonByID(int id) {
    return "$baseURL/pokemon/$id";
  }

  static String pokemonByName(String name) {
    return "$baseURL/pokemon/$name";
  }

  static String pokemonsList({int limit = 0, int offset = 0}) {
    return "$baseURL/pokemon?limit=$limit&offset=$offset";
  }
}
