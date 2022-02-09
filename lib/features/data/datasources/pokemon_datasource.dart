import 'package:pokedex_clean/features/data/models/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<PokemonModel> getAllPokemons(int offset, int limit);
  Future<PokemonModel> getPokemonByName(String name);
}