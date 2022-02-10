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
  }

  @observable
  HomeState _homeState = HomeState.intial;
  @computed
  HomeState get homeState => _homeState;

  ScrollController scrollController = ScrollController();

  final ObservableList _favoritesList = ObservableList();

  @observable
  List<PokemonEntity> _pokemons = [];

  @computed
  List<PokemonEntity> get pokemons => _pokemons;

  @observable
  String _searchText = '';

  @action
  setSearchText(String text){
    _searchText = text;
  }

  // @observable
  // int page = 0; //Random().nextInt(1110)

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
    await _getAllPokemonsUsecase.getAllPokemons(10, 10).then((response) async {
      if (response == null) {
        _pokemons = [];
      }
      var list = response['results'] as List;
      await _getPokemonDetails(list);
    }).catchError((error) {
      _homeState = HomeState.error;
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

    _pokemons.addAll(poke);
  }

  bool _favoritesHavePokemon(String name) {
    return _favoritesList
        .where((element) => element['name'] == name)
        .isNotEmpty;
  }
}
