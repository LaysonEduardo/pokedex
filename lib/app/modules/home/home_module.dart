import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.lazySingleton((_) => WelcomeStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
