import 'dart:convert';

import 'package:flutter_plus/flutter_plus.dart';
import 'package:pokedex_clean/core/errors/exceptions.dart';
import 'package:pokedex_clean/features/data/datasources/handle_favorites_datasource/handle_favorites_datasource.dart';

class HandleFavoritesDatasourceImpl implements HandleFavoritesDatasource {
  static const localStoragePath = 'favorites';

  @override
  Future deleteFavorites() async {
    final response = await localStoragePlus.delete(localStoragePath);

    if (response) {
      return response;
    }
    throw DeletingFavoriteException();
  }

  @override
  Future loadFavorites() async {
    final response = await localStoragePlus.read(localStoragePath);

    if (response == null) {
      throw LoadingFavoriteException();
    }
    return json.decode(response);
  }

  @override
  Future saveFavorites(String pokemon) async {
    try {
      await localStoragePlus.write(localStoragePath, pokemon);
      return true;
      
    } catch (e) {
      throw SavingFavoriteException();
    }
  }
}
