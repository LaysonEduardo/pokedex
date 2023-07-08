import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/src/utils/app_fonts.dart';
import 'package:pokedex_colaboraapp/src/widgets/utils/space.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../src/widgets/utils/keep_alive_wiget.dart';
import 'welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  final controller = Modular.get<WelcomeController>();
  late PageController pageController;

  @override
  void initState() {
    controller.init();

    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: AnimatedContainer(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: controller.is_loading
                  ? [Colors.grey, Colors.white]
                  : [controller.accentColor(), Colors.grey[400]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets/logo/pokeball_white.png',
                opacity: const AlwaysStoppedAnimation(.15),
              ),
              if (controller.is_loading) ...[
                const Center(child: CircularProgressIndicator())
              ] else ...[
                SafeArea(
                  child: ShowUpAnimation(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Title
                        Column(
                          children: [
                            Text(
                              'Welcome to',
                              style: AppFonts.medium(20,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(.5),
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    )
                                  ]),
                            ),
                            const VSpace(15),
                            Image.asset('assets/logo/pokedex.png'),
                          ],
                        ),
                        //Carousel
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height * 0.6,
                          ),
                          child: Stack(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.sizeOf(context).height * 0.4,
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: PageView.builder(
                                    controller: pageController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.welcome_pokemons.length,
                                    itemBuilder: (context, index) {
                                      return carouselObject(index);
                                    },
                                    onPageChanged: (index) {
                                      controller.changePage(index);
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Bem-vindo a Pokédex! Este aplicativo será seu guia pelo mundo dos Pokémon. Vamos mergulhar e explorar juntos!',
                                        style: AppFonts.medium(
                                          20,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VSpace(25),
                        MaterialButton(
                          shape: const StadiumBorder(),
                          color: Colors.white.withOpacity(0.8),
                          minWidth: 250,
                          elevation: 0,
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            controller.current_page == 2 ? 'Start' : 'Next',
                            style: AppFonts.medium(
                              20,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ),
                        Text(
                          'this its just a technical test, not commercial proposal',
                          style: AppFonts.regular(
                            15,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget carouselObject(int index) {
    return KeepAliveWidget(
      child: ShowUpAnimation(
        offset: (index == 0 || index == 1) ? -0.2 : 0.2,
        direction: index != 1 ? Direction.horizontal : Direction.vertical,
        child: Image.network(controller.welcome_pokemons[index].artwork_url),
      ),
    );
  }
}
