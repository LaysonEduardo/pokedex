import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/src/models/app/app_exceptions.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_simple_model.dart';
import 'package:pokedex_colaboraapp/src/repository/endpoints.dart';
import 'package:pokedex_colaboraapp/src/services/http/dio_service.dart';
import 'package:pokedex_colaboraapp/src/utils/poke_types.dart';

import '../models/pokemon/pokemon_model.dart';

class PokedexRepository {
  final DioServices _http = Modular.get<DioServices>();

  Future<Pokemon> getPokemon(int id) async {
    final Response response = await _http.get(Endpoints.pokemonByID(id));

    return Pokemon.fromJson(response.data);
  }

  Future<Pokemon> getPokemonWithURL(String url) async {
    final Response response = await _http.get(url);
    if (response.statusCode == 200) {
      return Pokemon.fromJson(response.data);
    } else {
      throw HTTPException();
    }
  }

  Future<List<PokemonSimple>> getPokemonWithType(PokemonType type) async {
    List<PokemonSimple> list = [];
    final Response list_response = await _http.get(
      Endpoints.pokemonsByType(type),
    );
    if (list_response.statusCode == 200) {
      for (var pokemon_value in list_response.data["pokemon"]) {
        list.add(PokemonSimple.fromJson(pokemon_value["pokemon"]));
      }
      return list;
    } else {
      throw HTTPException();
    }
  }

  Future<List<PokemonSimple>> getPokemons({
    int limit = 0,
    int offset = 0,
  }) async {
    List<PokemonSimple> list = [];
    final Response list_response = await _http.get(
      Endpoints.pokemonsList(limit: limit, offset: offset),
    );
    if (list_response.statusCode == 200) {
      for (var pokemon_value in list_response.data["results"]) {
        list.add(PokemonSimple.fromJson(pokemon_value));
      }
      return list;
    } else {
      throw HTTPException();
    }
  }
}
