import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokedexApp extends StatefulWidget {
  const PokedexApp({super.key});

  @override
  State<PokedexApp> createState() => _PokedexAppState();
}

class _PokedexAppState extends State<PokedexApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PokedexApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        // I18n.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      // locale: state.selectedLanguage?.value ?? deviceLanguage().value,
      // supportedLocales: const [
      //   Locale('en'),
      //   Locale('pt'),
      // ],
    );
  }
}
