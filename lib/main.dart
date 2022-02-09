import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_clean/app_module.dart';
import 'package:pokedex_clean/app_screen.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppScreen(),
    ),
  );
}
