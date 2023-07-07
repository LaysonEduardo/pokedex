import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/welcome/welcome_store.dart';
import 'package:show_up_animation/show_up_animation.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomeStore controller = Modular.get<WelcomeStore>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: controller.is_loading
            ? CircularProgressIndicator()
            : Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [controller.accentColor(), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  PageView(
                    children: [
                      Stack(
                        children: [
                          backgroundObject(0),
                          Container(
                            child: Text('Charmander'),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          backgroundObject(1),
                          Container(
                            child: Text('Charmander'),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          backgroundObject(2),
                          Container(
                            child: Text('Charmander'),
                          ),
                        ],
                      ),
                    ],
                    onPageChanged: (index) {
                      controller.changePage(index);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.red,
                        child: const Text('Next'),
                      ),
                    ),
                  )
                ],
              ),
      );
    });
  }

  Widget backgroundObject(int index) {
    return ShowUpAnimation(
      direction: index != 1 ? Direction.horizontal : Direction.vertical,
      child: Image(
        image: controller.welcome_pokemons[index].image_provider!.image,
      ),
    );
  }
}
