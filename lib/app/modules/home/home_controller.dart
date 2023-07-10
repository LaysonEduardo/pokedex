import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_simple_model.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  PokedexRepository respository = Modular.get<PokedexRepository>();
  ObservableList<PokemonSimple> pokemons_list =
      ObservableList<PokemonSimple>.of([]);

  @observable
  bool isLoading = false;

  Future<void> init() async {
    fetchPokemonsList();
  }

  @action
  Future<void> fetchPokemonsList() async {
    isLoading = true;
    final items = await respository.getPokemons(limit: 20, offset: 0);
    isLoading = false;
    pokemons_list.addAll(items);
  }

  @action
  Future<void> updatePokemonsList() async {}
}
