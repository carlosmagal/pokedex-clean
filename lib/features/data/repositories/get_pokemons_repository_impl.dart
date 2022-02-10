import 'package:pokedex_clean/core/errors/exceptions.dart';
import 'package:pokedex_clean/features/data/datasources/pokemon_datasource/pokemon_datasource.dart';
import 'package:pokedex_clean/features/domain/repositories/get_pokemons_repository.dart';

class GetPokemonsRepositoryImpl implements GetPokemonsRepository {

  final PokemonDatasource _datasource;

  GetPokemonsRepositoryImpl(this._datasource);
  @override
  Future getAll(int offset, int limit) async{
    try {
      final result = await _datasource.getAllPokemons(offset, limit);
      return result;
    } on ServerException {
      return null;
    }
  }

  @override
  Future getByName(String name) async {
    try {
      final result = await _datasource.getPokemonByName(name);
      return result;
    } on WrongNameException {
      return null;
    }
  }
}