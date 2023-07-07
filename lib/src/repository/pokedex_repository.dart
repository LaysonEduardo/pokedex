import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/src/repository/endpoints.dart';
import 'package:pokedex_colaboraapp/src/services/http/dio_service.dart';

import '../models/pokemon/pokemon_model.dart';

class PokedexRepository {
  final DioServices _http = Modular.get<DioServices>();

  Future<Pokemon> getPokemon(int id) async {
    final Response response = await _http.get(Endpoints.pokemonByID(id));

    return Pokemon.fromJson(response.data);
  }
}
