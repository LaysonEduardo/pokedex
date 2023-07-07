final class Endpoints {
  Endpoints._();
  static const String baseURL = 'https://pokeapi.co/api/v2';

  static String pokemonByID(int id) {
    return "$baseURL/pokemon/$id";
  }

  static String pokemonByName(String name) {
    return "$baseURL/pokemon/$name";
  }
}
