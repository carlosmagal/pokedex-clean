abstract class PokemonDatasource {
  Future getAllPokemons(int offset, int limit);
  Future getPokemonByName(String name);
}