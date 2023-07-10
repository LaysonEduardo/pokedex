import 'package:mobx/mobx.dart';

import '../../../src/models/pokemon/pokemon_model.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  ObservableList<Pokemon> pokemons_list = ObservableList<Pokemon>.of([]);

  @observable
  bool isLoading = false;

  Future<void> init() async {}

  @action
  Future<void> fetchPokemonsList() async {}

  @action
  Future<void> updatePokemonsList() async {}
}
