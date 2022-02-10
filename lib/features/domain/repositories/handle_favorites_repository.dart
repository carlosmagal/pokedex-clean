import 'package:pokedex_clean/features/domain/entities/pokemon_entity.dart';

abstract class HandleFavoritesRepository {
  Future deleteFavorites();
  Future loadFavorites();
  Future saveFavorites(PokemonEntity pokemon);
}
