// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WelcomeStore on WelcomeStoreBase, Store {
  late final _$current_pageAtom =
      Atom(name: 'WelcomeStoreBase.current_page', context: context);

  @override
  int get current_page {
    _$current_pageAtom.reportRead();
    return super.current_page;
  }

  @override
  set current_page(int value) {
    _$current_pageAtom.reportWrite(value, super.current_page, () {
      super.current_page = value;
    });
  }

  late final _$is_loadingAtom =
      Atom(name: 'WelcomeStoreBase.is_loading', context: context);

  @override
  bool get is_loading {
    _$is_loadingAtom.reportRead();
    return super.is_loading;
  }

  @override
  set is_loading(bool value) {
    _$is_loadingAtom.reportWrite(value, super.is_loading, () {
      super.is_loading = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('WelcomeStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$changePageAsyncAction =
      AsyncAction('WelcomeStoreBase.changePage', context: context);

  @override
  Future<void> changePage(int index) {
    return _$changePageAsyncAction.run(() => super.changePage(index));
  }

  late final _$acceptAsyncAction =
      AsyncAction('WelcomeStoreBase.accept', context: context);

  @override
  Future<void> accept() {
    return _$acceptAsyncAction.run(() => super.accept());
  }

  @override
  String toString() {
    return '''
current_page: ${current_page},
is_loading: ${is_loading}
    ''';
  }
}
