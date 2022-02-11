abstract class HandleFavoritesDatasource {
  Future deleteFavorites();
  Future loadFavorites();
  Future saveFavorites(String pokemon);
}