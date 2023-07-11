// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$current_filter_typeAtom =
      Atom(name: 'HomeControllerBase.current_filter_type', context: context);

  @override
  PokemonType? get current_filter_type {
    _$current_filter_typeAtom.reportRead();
    return super.current_filter_type;
  }

  @override
  set current_filter_type(PokemonType? value) {
    _$current_filter_typeAtom.reportWrite(value, super.current_filter_type, () {
      super.current_filter_type = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchPokemonsListAsyncAction =
      AsyncAction('HomeControllerBase.fetchPokemonsList', context: context);

  @override
  Future<void> fetchPokemonsList() {
    return _$fetchPokemonsListAsyncAction.run(() => super.fetchPokemonsList());
  }

  late final _$updatePokemonsAsyncAction =
      AsyncAction('HomeControllerBase.updatePokemons', context: context);

  @override
  Future<void> updatePokemons() {
    return _$updatePokemonsAsyncAction.run(() => super.updatePokemons());
  }

  late final _$filterPokemonsAsyncAction =
      AsyncAction('HomeControllerBase.filterPokemons', context: context);

  @override
  Future<void> filterPokemons() {
    return _$filterPokemonsAsyncAction.run(() => super.filterPokemons());
  }

  @override
  String toString() {
    return '''
current_filter_type: ${current_filter_type},
isLoading: ${isLoading}
    ''';
  }
}
