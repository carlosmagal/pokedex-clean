import 'package:pokedex_clean/core/errors/exceptions.dart';
import 'package:pokedex_clean/features/data/datasources/handle_favorites_datasource/handle_favorites_datasource.dart';
import 'package:pokedex_clean/features/domain/repositories/handle_favorites_repository.dart';

class HandleFavoritesRepositoryImpl implements HandleFavoritesRepository {
  final HandleFavoritesDatasource _datasource;
  HandleFavoritesRepositoryImpl(this._datasource);

  @override
  Future deleteFavorites() async {
    try {
      final result = await _datasource.deleteFavorites();
      return result;
    } on DeletingFavoriteException {
      return null;
    }
  }

  @override
  Future loadFavorites() async {
    try {
      return await _datasource.loadFavorites();
    } on LoadingFavoriteException {
      return null;
    }
  }

  @override
  Future saveFavorites(String pokemon) async {
    try {
      final result = await _datasource.saveFavorites(pokemon);
      return result;
    } on LoadingFavoriteException {
      return null;
    }
  }
}
