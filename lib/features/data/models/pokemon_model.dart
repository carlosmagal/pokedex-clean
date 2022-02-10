import 'package:pokedex_clean/features/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required String name,
    required int id,
    required String imgUrl,
    required List<dynamic> types,
    required Map<String, dynamic> stats,
    required bool isFavorite,
  }) : super(
          name: name,
          id: id,
          imgUrl: imgUrl,
          types: types,
          stats: stats,
          isFavorite: isFavorite,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json, {bool value = false}) =>
      PokemonModel(
        name: json['name'],
        id: json['id'],
        imgUrl: json['sprites']['other']['official-artwork']['front_default'],
        types: _getTypes(json['types']),
        stats: _getStats(json['stats']),
        isFavorite: value,
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['imgUrl'] = imgUrl;
    map['id'] = id;
    map['types'] = types;
    map['stats'] = stats;
    map['isFavorite'] = isFavorite;
    return map;
  }

  static Map<String, dynamic> _getStats(List<dynamic> pokemonStats) {
    return {
      'HP': pokemonStats[0]['base_stat'],
      'Attack': pokemonStats[1]['base_stat'],
      'Defense': pokemonStats[2]['base_stat'],
      'Special-Attack': pokemonStats[3]['base_stat'],
      'Special-Defense': pokemonStats[4]['base_stat'],
      'Speed': pokemonStats[5]['base_stat'],
    };
  }

  static List<String> _getTypes(List<dynamic> pokemonTypes) {
    List<String> typeList = [];

    for (var element in pokemonTypes) {
      typeList.add(element['type']['name']);
    }

    return typeList;
  }

  @override 
  String toString(){
    return 'PokemonModel: {name: $name, imgUrl: $imgUrl, id: $id, types: $types, stats: $stats';
  }
}
