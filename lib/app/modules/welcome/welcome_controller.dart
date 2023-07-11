import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_model.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';
import 'package:pokedex_colaboraapp/src/services/storage/base/local_storage_base.dart';
import 'package:pokedex_colaboraapp/src/utils/app_colors.dart';

part 'welcome_controller.g.dart';

class WelcomeController = WelcomeControllerBase with _$WelcomeController;

abstract class WelcomeControllerBase with Store {
  PokedexRepository respository = Modular.get<PokedexRepository>();
  LocalStorageService localStorage = Modular.get<LocalStorageService>();

  ObservableList<Pokemon> welcome_pokemons = ObservableList<Pokemon>.of([]);
  List<String> messages = [
    'Welcome to the world of Pokémon! Start your journey and uncover the mysteries of these incredible creatures',
    "Get ready to explore a vast universe discovering random Pokémons. Ctach 'em all and become a Pokémon Master!",
    'Discover a lot infos about your favorite pokemon.'
  ];

  @observable
  int current_page = 0;

  @observable
  bool is_loading = false;

  @action
  Future<void> init() async {
    is_loading = true;
    await localStorage.init();
    final has_accessed = await checkFirstAccess() ?? false;
    if (has_accessed) {
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
    final pokemon = await respository.getPokemon(random_id);
    pokemon.mainColor = await AppColors.pokemonBaseColor(
        Image.network(pokemon.artwork_url).image);

    welcome_pokemons.add(pokemon);
  }

  @action
  Future<void> changePage(int index) async {
    current_page = index;
  }

  @action
  Future start() async {
    await localStorage.saveBool('already_started', true);
    Modular.to.navigate('/home/');
  }

  Color accentColor() {
    return welcome_pokemons[current_page].mainColor;
  }

  Future<bool?> checkFirstAccess() async {
    return await localStorage.getBool('already_started');
  }
}
