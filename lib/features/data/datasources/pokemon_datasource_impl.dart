import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_clean/core/config/constants.dart';
import 'package:pokedex_clean/core/errors/exceptions.dart';

import 'package:pokedex_clean/features/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_clean/features/data/models/pokemon_model.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final _client = Dio();

  @override
  Future<PokemonModel> getAllPokemons(int offset, int limit) async {
    final url =
        PokedexConstants.baseUrl + 'pokemon/?offset=$offset&limit=$limit';
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.data));
    }

    throw ServerException();
  }

  @override
  Future<PokemonModel> getPokemonByName(String name) async {
    final url = PokedexConstants.baseUrl + 'pokemon/$name';
    final response = await _client.get(url);

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.data));
    }
    
    throw WrongNameException();
  }
}
