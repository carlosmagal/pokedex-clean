import 'package:pokedex_clean/features/domain/repositories/handle_favorites_repository.dart';
import 'package:pokedex_clean/features/domain/usecases/save_favorite/handle_favorites_usecase.dart';

class HandleFavoritesUsecaseImpl implements HandleFavoritesUsecase {
  final HandleFavoritesRepository _repository;

  HandleFavoritesUsecaseImpl(this._repository);

  @override
  Future deleteFavorites() async {
    return _repository.deleteFavorites();
  }

  @override
  Future loadFavorites() async {
    return _repository.loadFavorites();
  }

  @override
  Future saveFavorites(
    String pokemon, {
    bool changeIsFavorite = true,
  }) async {
    return _repository.saveFavorites(pokemon);
  }
}
