import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/welcome/welcome_page.dart';
import 'package:pokedex_colaboraapp/app/welcome/welcome_store.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';

import '../src/services/http/dio_service.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((_) => WelcomeStore()),
        Bind.lazySingleton((i) => DioServices(Dio())),
        Bind.lazySingleton((_) => PokedexRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const WelcomePage()),
      ];
}
