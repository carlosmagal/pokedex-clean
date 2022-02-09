abstract class GetPokemonsRepository {
  Future getAll(int offset, int limit);
  Future getByName(String name);
}