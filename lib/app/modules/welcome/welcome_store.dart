import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_model.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';
import 'package:pokedex_colaboraapp/src/services/storage/base/local_storage_base.dart';
import 'package:pokedex_colaboraapp/src/utils/app_colors.dart';

part 'welcome_store.g.dart';

class WelcomeStore = WelcomeStoreBase with _$WelcomeStore;

abstract class WelcomeStoreBase with Store {
  PokedexRepository pokedex = Modular.get<PokedexRepository>();
  LocalStorageService localStorage = Modular.get<LocalStorageService>();

  ObservableList<Pokemon> welcome_pokemons = ObservableList<Pokemon>.of([]);

  AppColors appColors = AppColors();

  @observable
  int current_page = 0;

  @observable
  bool is_loading = false;

  @action
  Future<void> init() async {
    is_loading = true;
    await localStorage.init();
    final has_accessed = await checkFirstAccess() ?? false;
    if (!has_accessed) {
      Modular.to.navigate('/home/');
    }
    await Future.wait([
      addPokemon(),
      addPokemon(),
      addPokemon(),
    ]);
    is_loading = false;
  }

  Future<void> addPokemon() async {
    final random_id = Random().nextInt(1010 - 1);
    final pokemon = await pokedex.getPokemon(random_id);
    pokemon.image_provider = Image.network(pokemon.artwork_url);
    if (pokemon.image_provider != null) {
      pokemon.dominant_color =
          await appColors.pokemonColor(pokemon.image_provider!.image);
    }
    welcome_pokemons.add(pokemon);
  }

  @action
  Future<void> changePage(int index) async {
    current_page = index;
  }

  @action
  Future<void> accept() async {}

  Color accentColor() {
    return welcome_pokemons[current_page].dominant_color?.color ?? Colors.grey;
  }

  Future<bool?> checkFirstAccess() async {
    return await localStorage.getBool('already_started');
  }
}
