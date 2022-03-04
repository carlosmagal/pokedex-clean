import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_clean/features/data/datasources/handle_favorites_datasource/handle_favorites_datasource_impl.dart';
import 'package:pokedex_clean/features/data/datasources/pokemon_datasource/pokemon_datasource_impl.dart';
import 'package:pokedex_clean/features/data/repositories/get_pokemons_repository_impl.dart';
import 'package:pokedex_clean/features/data/repositories/handle_favorites_repository_impl.dart';
import 'package:pokedex_clean/features/domain/usecases/get_all_pokemons_usecase.dart/get_all_pokemons_usecase_impl.dart';
import 'package:pokedex_clean/features/domain/usecases/get_pokemon_by_name_usecase.dart/get_pokemon_by_name_usecase_impl.dart';
import 'package:pokedex_clean/features/domain/usecases/save_favorite/handle_favorites_usecase_impl.dart';
import 'package:pokedex_clean/features/presenter/controllers/home_controller.dart';
import 'package:pokedex_clean/features/presenter/screens/details_screen.dart';
import 'package:pokedex_clean/features/presenter/screens/home_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(((i) => HomeController(i(), i(), i()))),
        Bind(((i) => GetPokemonByNameUsecaseImpl(i()))),
        Bind(((i) => GetAllPokemonsUsecaseImpl(i()))),
        Bind(((i) => HandleFavoritesUsecaseImpl(i()))),
        Bind(((i) => HandleFavoritesDatasourceImpl())),
        Bind(((i) => PokemonDatasourceImpl())),
        Bind(((i) => HandleFavoritesRepositoryImpl(i()))),
        Bind(((i) => GetPokemonsRepositoryImpl(i()))),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomeScreen()),
        ChildRoute(
          '/details',
          child: (_, args) => DetailsScreen(
            index: args.data[0],
          ),
        ),
      ];
}
