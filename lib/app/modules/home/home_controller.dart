import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_simple_model.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';
import 'package:pokedex_colaboraapp/src/utils/debouncer.dart';
import 'package:pokedex_colaboraapp/src/utils/poke_types.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  PokedexRepository respository = Modular.get<PokedexRepository>();

  ObservableList<PokemonSimple> pokemons_list = ObservableList.of([]);

  @observable
  PokemonType? current_filter_type;

  @observable
  bool isLoading = false;

  Future<void> init() async {
    fetchPokemonsList();
  }

  @action
  Future<void> fetchPokemonsList() async {
    isLoading = true;
    pokemons_list.clear();
    final items = await respository.getPokemons(limit: 60, offset: 0);
    pokemons_list.addAll(items);
    isLoading = false;
  }

  @action
  Future<void> updatePokemons() async {
    if (current_filter_type == null) {
      Debouncer.run(() async {
        final items = await respository.getPokemons(
          limit: 20,
          offset: pokemons_list.length,
        );
        pokemons_list.addAll(items);
      }, duration: const Duration(milliseconds: 100));
    }
  }

  @action
  Future<void> filterPokemons() async {
    if (current_filter_type != null) {
      isLoading = true;
      pokemons_list.clear();
      final items = await respository.getPokemonWithType(current_filter_type!);
      pokemons_list.addAll(items);
      isLoading = false;
    } else {
      fetchPokemonsList();
    }
  }

  Future<void> randomPokemon() async {
    final random_id = Random().nextInt(1010 - 1);
    final pokemon = await respository.getPokemon(random_id);
    Modular.to.pushNamed('./details', arguments: pokemon);
  }
}
