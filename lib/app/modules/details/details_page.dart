import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/poke_background.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/poke_loading.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/space.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_model.dart';
import 'package:pokedex_colaboraapp/src/utils/app_colors.dart';
import 'package:pokedex_colaboraapp/src/utils/app_fonts.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';

import '../../commom/widgets/type_tag.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          '${pokemon.name.capitalize()} #${pokemon.id}',
          style: const AppFonts.medium(20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: PokeBackground(
        accent: pokemon.types[0].color.withLightness(0.4),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pokemon.types.length,
                    (index) {
                      return TypeTag(
                        type: pokemon.types[index],
                        fontSize: 15,
                        width: 100,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.8,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'About',
                              style: AppFonts.medium(
                                20,
                                color:
                                    pokemon.types[0].color.withLightness(0.4),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 50),
                              child: Divider(
                                color:
                                    pokemon.types[0].color.withLightness(0.4),
                              ),
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Specie name: ',
                                        style: AppFonts.medium(
                                          20,
                                          color: pokemon.types[0].color
                                              .withLightness(0.4),
                                        ),
                                      ),
                                      const VSpace(15),
                                      Text(
                                        'Height: ',
                                        style: AppFonts.medium(
                                          20,
                                          color: pokemon.types[0].color
                                              .withLightness(0.4),
                                        ),
                                      ),
                                      const VSpace(15),
                                      Text(
                                        'Weight: ',
                                        style: AppFonts.medium(
                                          20,
                                          color: pokemon.types[0].color
                                              .withLightness(0.4),
                                        ),
                                      ),
                                      const VSpace(15),
                                      Text(
                                        'Abilities: ',
                                        style: AppFonts.medium(
                                          20,
                                          color: pokemon.types[0].color
                                              .withLightness(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const HSpace(5),
                                  VerticalDivider(
                                    color: pokemon.types[0].color
                                        .withLightness(0.4),
                                  ),
                                  const HSpace(25),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pokemon.name.capitalize(),
                                          style: AppFonts.regular(
                                            20,
                                            color: pokemon.types[0].color
                                                .withOpacity(0.9),
                                          ),
                                        ),
                                        const VSpace(15),
                                        Text(
                                          '${pokemon.height} cm',
                                          style: AppFonts.regular(
                                            20,
                                            color: pokemon.types[0].color
                                                .withOpacity(0.9),
                                          ),
                                        ),
                                        const VSpace(15),
                                        Text(
                                          '${pokemon.weight} kg',
                                          style: AppFonts.regular(
                                            20,
                                            color: pokemon.types[0].color
                                                .withOpacity(0.9),
                                          ),
                                        ),
                                        const VSpace(15),
                                        Text(
                                          pokemon.abilities.join(', '),
                                          style: AppFonts.regular(
                                            20,
                                            color: pokemon.types[0].color
                                                .withOpacity(0.9),
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        pokemon.artwork_url,
                        height: 300,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress?.cumulativeBytesLoaded ==
                              loadingProgress?.expectedTotalBytes) {
                            return child;
                          } else {
                            return const PokeLoading(size: 100);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
