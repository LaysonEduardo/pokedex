import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/fade_edges.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/poke_background.dart';

import '../../commom/widgets/poke_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        print('in end');
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
        // appBar: const PokeAppBar(),
        body: PokeBackground(
          accent: Colors.red,
          child: CustomScrollView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white.withOpacity(0.8),
                title: Image.asset(
                  'assets/logo/pokedex.png',
                  height: 30,
                ),
                centerTitle: true,
                bottom: PokeSearchBar(),
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
                child: Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        primary: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: 25,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text('test'),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
