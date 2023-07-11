import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/poke_background.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/poke_loading.dart';
import 'package:pokedex_colaboraapp/app/modules/home/home_controller.dart';
import 'package:pokedex_colaboraapp/app/modules/home/widgets/filter_bottom_sheet.dart';
import 'package:pokedex_colaboraapp/app/modules/home/widgets/pokemon_card.dart';
import 'package:pokedex_colaboraapp/src/models/app/app_exceptions.dart';
import 'package:pokedex_colaboraapp/src/utils/debouncer.dart';
import '../../commom/dialogs/error_dialog.dart';

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
    controller.init().catchError((error) {
      if (error is HTTPException) {
        showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(
              errorMessage: 'Check your internet access and try again.',
            );
          },
        );
      }
    });
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        Debouncer.run(() {
          controller.updatePokemons();
        });
      }
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
          accent: Colors.grey,
          child: RefreshIndicator(
            edgeOffset: 55,
            onRefresh: () async {
              return controller.fetchPokemonsList();
            },
            child: Stack(
              children: [
                Scrollbar(
                  controller: scrollController,
                  radius: const Radius.circular(5),
                  trackVisibility: true,
                  thickness: 5,
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.white,
                        title: Image.asset(
                          'assets/logo/pokedex.png',
                          height: 30,
                        ),
                        centerTitle: true,
                        actions: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white.withOpacity(0.8),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                builder: (context) {
                                  return FilterBottomSheet(
                                    currentType: controller.current_filter_type,
                                    onSelect: (type) {
                                      controller.current_filter_type = type;
                                      controller.filterPokemons();
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                Icons.tune,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                        ],
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
                            ? const SizedBox.shrink()
                            : GridView.builder(
                                shrinkWrap: true,
                                primary: true,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                // itemExtent: 130,
                                physics: const BouncingScrollPhysics(),

                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  maxCrossAxisExtent: 250,
                                  mainAxisExtent: 140,
                                  childAspectRatio: 1 / 2,
                                ),
                                itemCount: controller.pokemons_list.length,

                                itemBuilder: (BuildContext ctx, index) {
                                  return PokemonCard(
                                    pokemon_data:
                                        controller.pokemons_list[index],
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: controller.isLoading,
                  child: const Center(
                    child: PokeLoading(size: 100),
                  ),
                ),
              ],
            ),
          ),
        ),
        extendBody: true,
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.randomPokemon();
          },
          backgroundColor: Colors.white,
          child: Image.asset('assets/icons/pokeball.png'),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      );
    });
  }
}
