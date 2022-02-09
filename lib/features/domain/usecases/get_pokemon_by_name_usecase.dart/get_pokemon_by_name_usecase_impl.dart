import 'package:pokedex_clean/features/domain/repositories/get_pokemons_repository.dart';
import 'package:pokedex_clean/features/domain/usecases/get_pokemon_by_name_usecase.dart/get_pokemon_by_name_usecase.dart';

class GetPokemonByNameUsecaseImpl implements GetPokemonByNameUsecase {

  final GetPokemonsRepository _repository;
  GetPokemonByNameUsecaseImpl(this._repository);
  
  @override
  Future getPokemonByName(String name) async{
    return await _repository.getByName(name);
  }

}