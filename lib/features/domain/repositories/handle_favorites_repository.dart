abstract class HandleFavoritesRepository {
  Future deleteFavorites();
  Future loadFavorites();
  Future saveFavorites(String pokemon);
}
