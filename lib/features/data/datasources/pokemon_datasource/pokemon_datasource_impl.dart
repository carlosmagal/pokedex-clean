import 'package:dio/dio.dart';
import 'package:pokedex_clean/core/config/constants.dart';
import 'package:pokedex_clean/core/errors/exceptions.dart';

import 'package:pokedex_clean/features/data/datasources/pokemon_datasource/pokemon_datasource.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final _client = Dio();

  @override
  Future getAllPokemons(int offset, int limit) async {
    final url =
        PokedexConstants.baseUrl + 'pokemon/?offset=$offset&limit=$limit';
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ServerException();
  }

  @override
  Future getPokemonByName(String name) async {
    final url = PokedexConstants.baseUrl + 'pokemon/$name';
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      return response.data;
    }
    
    throw WrongNameException();
  }
}
