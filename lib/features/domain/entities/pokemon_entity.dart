class PokemonEntity {
  String name;
  int id;
  String imgUrl;
  List<dynamic> types;
  Map<String, dynamic> stats;
  bool isFavorite;

  PokemonEntity({
    required this.name,
    required this.id,
    required this.imgUrl,
    required this.types,
    required this.stats,
    required this.isFavorite,
  });
}
