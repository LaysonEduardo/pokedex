import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/modules/welcome/welcome_module.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';
import 'package:pokedex_colaboraapp/src/services/storage/shared_preferences_service.dart';

import '../src/services/http/dio_service.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => DioServices(Dio())),
        Bind.lazySingleton((i) => SharedPreferencesStorageService()),
        Bind.lazySingleton((_) => PokedexRepository()),
      ];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: WelcomeModule())];
}
