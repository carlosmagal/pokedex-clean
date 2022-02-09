import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_clean/features/presenter/screens/home_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomeScreen()),
      ];
}
