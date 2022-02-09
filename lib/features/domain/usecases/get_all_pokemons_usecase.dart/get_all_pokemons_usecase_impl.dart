import 'package:pokedex_clean/features/domain/repositories/get_pokemons_repository.dart';
import 'package:pokedex_clean/features/domain/usecases/get_all_pokemons_usecase.dart/get_all_pokemons_usecase.dart';

class GetAllPokemonsUsecaseImpl implements GetAllPokemonsUsecase {
  final GetPokemonsRepository _repository;
  GetAllPokemonsUsecaseImpl(this._repository);

  @override
  Future getAllPokemons(int offset, int limit) {
    return _repository.getAll(offset, limit);
  }
}
