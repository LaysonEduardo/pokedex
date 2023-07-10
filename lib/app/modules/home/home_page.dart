import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/poke_background.dart';
import 'package:pokedex_colaboraapp/app/modules/home/home_controller.dart';
import 'package:pokedex_colaboraapp/app/modules/home/widgets/pokemon_card.dart';
import 'package:pokedex_colaboraapp/src/utils/debouncer.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../commom/widgets/poke_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Modular.get<HomeController>();
  late ScrollController scrollController;

  @override
  void initState() {
    controller.init();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {}
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: PokeBackground(
          accent: Colors.red,
          child: RefreshIndicator(
            edgeOffset: 105,
            onRefresh: () async {
              await Timer(Duration(milliseconds: 500), () {});
            },
            child: CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  title: Image.asset(
                    'assets/logo/pokedex.png',
                    height: 30,
                  ),
                  centerTitle: true,
                  bottom: PokeSearchBar(
                    onChanged: (string) {
                      Debouncer.run(() {
                        print(string);
                      });
                    },
                  ),
                  floating: true,
                  snap: true,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: true,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          itemExtent: 130,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.pokemons_list.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return PokemonCard(
                              pokemon_data: controller.pokemons_list[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
        extendBody: true,
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: Visibility(
          visible: controller.isLoading,
          child: ShowUpAnimation(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const CircularProgressIndicator(strokeWidth: 3),
              ),
            ),
          ),
        ),
      );
    });
  }
}
