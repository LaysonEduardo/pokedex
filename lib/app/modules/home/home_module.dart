import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/modules/details/details_page.dart';
import 'package:pokedex_colaboraapp/app/modules/home/home_controller.dart';
import 'package:pokedex_colaboraapp/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((_) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/details',
          child: (context, args) => DetailsPage(pokemon: args.data),
        ),
      ];
}
