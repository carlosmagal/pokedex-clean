import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_clean/features/data/models/pokemon_model.dart';
import 'package:pokedex_clean/features/domain/entities/pokemon_entity.dart';
import 'package:pokedex_clean/features/domain/usecases/get_all_pokemons_usecase.dart/get_all_pokemons_usecase.dart';
import 'package:pokedex_clean/features/domain/usecases/get_pokemon_by_name_usecase.dart/get_pokemon_by_name_usecase.dart';
import 'package:pokedex_clean/features/domain/usecases/save_favorite/handle_favorites_usecase.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

enum HomeState { intial, loading, done, error, filtering }

abstract class _HomeControllerBase with Store {
  final GetPokemonByNameUsecase _getPokemonByNameUsecase;
  final GetAllPokemonsUsecase _getAllPokemonsUsecase;
  final HandleFavoritesUsecase _favoritesUsecase;

  _HomeControllerBase(
    this._getPokemonByNameUsecase,
    this._getAllPokemonsUsecase,
    this._favoritesUsecase,
  ) {
    _initializeController();
  }

  @action
  _initializeController() async {
    _homeState = HomeState.loading;
    await _loadFavorites();
    await _getPokemons();
    _loadScrollController();
    _homeState = HomeState.done;
  }

  @observable
  HomeState _homeState = HomeState.intial;
  @computed
  HomeState get homeState => _homeState;

  ScrollController scrollController = ScrollController();

  final ObservableList _favoritesList = ObservableList();

  @observable
  ObservableList<PokemonEntity> _pokemons = ObservableList<PokemonEntity>();

  @action
  setPokemons(pokelist) => _pokemons = pokelist;

  @computed
  List<PokemonEntity> get pokemons => _pokemons;

  @observable
  String _searchText = '';

  @action
  setSearchText(String text) {
    _searchText = text;
  }

  @action
  Future<bool> _loadFavorites() async {
    final result = await _favoritesUsecase.loadFavorites();

    if (result != null) {
      _favoritesList.addAll(result);
    }
    return result != null;
  }

  @action
  _loadScrollController() {
    // scrollController.addListener(() async{

    // });
  }

  @action
  _getPokemons() async {
    await _getAllPokemonsUsecase.getAllPokemons(0, 10).then((response) async {
      var list = response['results'] as List;
      await _getPokemonDetails(list);
    }).catchError((error) {
      _homeState = HomeState.error;
      // print(error);
    });
  }

  @action
  _getPokemonDetails(List list) async {
    List<PokemonEntity> poke = [];

    for (var element in list) {
      await _getPokemonByNameUsecase
          .getPokemonByName(element['name'])
          .then((response) {
        if (response == null) {
          return;
        }
        poke.add(PokemonModel.fromJson(
          response,
          value: _favoritesHavePokemon(element['name']),
        ));
      });
    }
    _pokemons.clear();
    _pokemons.addAll(poke);
  }

  bool _favoritesHavePokemon(String name) {
    return _favoritesList
        .where((element) => element['name'] == name)
        .isNotEmpty;
  }

  @action
  saveFavorite(int index) async {
    if (_pokemons.isEmpty) return;

    _pokemons[index].isFavorite = !_pokemons[index].isFavorite;
    final poke = _pokemons[index] as PokemonModel;

    if (poke.isFavorite) {
      if (_favoritesHavePokemon(poke.name)) {
        return;
      } else {
        _favoritesList.add(poke.toMap());
      }
    } else {
      if (_favoritesHavePokemon(poke.name)) {
        _favoritesList.removeWhere((element) => element['name'] == poke.name);
      }
    }

    if (_homeState == HomeState.filtering) {
      _pokemons.removeWhere((element) => element.name == poke.name);
    }

    await _favoritesUsecase.deleteFavorites();
    await _favoritesUsecase.saveFavorites(json.encode(_favoritesList));
  }

  @action
  showFavorites() async {
    if (_homeState == HomeState.filtering) {
      _homeState = HomeState.loading;
      _getPokemons();
      await Future.delayed(
        const Duration(seconds: 2),
        () => _homeState = HomeState.intial,
      );
      return;
    }

    _homeState = HomeState.loading;
    _pokemons.clear();

    for (var element in _favoritesList) {
      if (element['isFavorite']) {
        _pokemons.add(PokemonModel.fromFavoritesMap(element));
      }
    }

    _pokemons.sort(((a, b) => a.id.compareTo(b.id)));
    await Future.delayed(
      const Duration(seconds: 2),
      () => _homeState = HomeState.filtering,
    );
  }
}
