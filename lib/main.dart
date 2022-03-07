import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_clean/app_module.dart';
import 'package:pokedex_clean/app_screen.dart';
import 'package:pokedex_clean/features/presenter/firebase_messaging/custom_firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CustomFirebaseMessaging().inicialize();
  await CustomFirebaseMessaging().getFirebaseToken();
  
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppScreen(),
    ),
  );
}
