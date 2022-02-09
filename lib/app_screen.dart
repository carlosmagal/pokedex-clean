import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> with WidgetsBindingObserver {

  @override
  void initState() {
    _customInit();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {}
  }

  _customInit() {
    _configureAppSettings();
  }

  _configureAppSettings() {
    WidgetsBinding.instance?.addObserver(this);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pokedex clean',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: true,
    ).modular();
  }
}
