// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<HomeState>? _$homeStateComputed;

  @override
  HomeState get homeState =>
      (_$homeStateComputed ??= Computed<HomeState>(() => super.homeState,
              name: '_HomeControllerBase.homeState'))
          .value;
  Computed<List<PokemonEntity>>? _$pokemonsComputed;

  @override
  List<PokemonEntity> get pokemons => (_$pokemonsComputed ??=
          Computed<List<PokemonEntity>>(() => super.pokemons,
              name: '_HomeControllerBase.pokemons'))
      .value;

  final _$_homeStateAtom = Atom(name: '_HomeControllerBase._homeState');

  @override
  HomeState get _homeState {
    _$_homeStateAtom.reportRead();
    return super._homeState;
  }

  @override
  set _homeState(HomeState value) {
    _$_homeStateAtom.reportWrite(value, super._homeState, () {
      super._homeState = value;
    });
  }

  final _$_pokemonsAtom = Atom(name: '_HomeControllerBase._pokemons');

  @override
  ObservableList<PokemonEntity> get _pokemons {
    _$_pokemonsAtom.reportRead();
    return super._pokemons;
  }

  @override
  set _pokemons(ObservableList<PokemonEntity> value) {
    _$_pokemonsAtom.reportWrite(value, super._pokemons, () {
      super._pokemons = value;
    });
  }

  final _$_searchTextAtom = Atom(name: '_HomeControllerBase._searchText');

  @override
  String get _searchText {
    _$_searchTextAtom.reportRead();
    return super._searchText;
  }

  @override
  set _searchText(String value) {
    _$_searchTextAtom.reportWrite(value, super._searchText, () {
      super._searchText = value;
    });
  }

  final _$_initializeControllerAsyncAction =
      AsyncAction('_HomeControllerBase._initializeController');

  @override
  Future _initializeController() {
    return _$_initializeControllerAsyncAction
        .run(() => super._initializeController());
  }

  final _$_loadFavoritesAsyncAction =
      AsyncAction('_HomeControllerBase._loadFavorites');

  @override
  Future<bool> _loadFavorites() {
    return _$_loadFavoritesAsyncAction.run(() => super._loadFavorites());
  }

  final _$_getPokemonsAsyncAction =
      AsyncAction('_HomeControllerBase._getPokemons');

  @override
  Future _getPokemons() {
    return _$_getPokemonsAsyncAction.run(() => super._getPokemons());
  }

  final _$_getPokemonDetailsAsyncAction =
      AsyncAction('_HomeControllerBase._getPokemonDetails');

  @override
  Future _getPokemonDetails(List<dynamic> list) {
    return _$_getPokemonDetailsAsyncAction
        .run(() => super._getPokemonDetails(list));
  }

  final _$saveFavoriteAsyncAction =
      AsyncAction('_HomeControllerBase.saveFavorite');

  @override
  Future saveFavorite(int index) {
    return _$saveFavoriteAsyncAction.run(() => super.saveFavorite(index));
  }

  final _$showFavoritesAsyncAction =
      AsyncAction('_HomeControllerBase.showFavorites');

  @override
  Future showFavorites() {
    return _$showFavoritesAsyncAction.run(() => super.showFavorites());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setPokemons(dynamic pokelist) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPokemons');
    try {
      return super.setPokemons(pokelist);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchText(String text) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSearchText');
    try {
      return super.setSearchText(text);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _loadScrollController() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase._loadScrollController');
    try {
      return super._loadScrollController();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homeState: ${homeState},
pokemons: ${pokemons}
    ''';
  }
}
