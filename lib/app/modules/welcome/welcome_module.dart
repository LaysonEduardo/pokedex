import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'welcome_page.dart';
import 'welcome_controller.dart';

class WelcomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((_) => WelcomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const WelcomePage()),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
