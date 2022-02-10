import 'package:pokedex_clean/features/domain/entities/pokemon_entity.dart';

abstract class HandleFavoritesUsecase {
  Future loadFavorites();
  Future saveFavorites(PokemonEntity pokemon, {bool changeIsFavorite});
  Future deleteFavorites();
}