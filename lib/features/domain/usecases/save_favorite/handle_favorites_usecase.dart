abstract class HandleFavoritesUsecase {
  Future loadFavorites();
  Future saveFavorites(String pokemon, {bool changeIsFavorite});
  Future deleteFavorites();
}