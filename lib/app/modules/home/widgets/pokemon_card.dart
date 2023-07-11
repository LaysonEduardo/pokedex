import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/type_tag.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_model.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_simple_model.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';
import 'package:pokedex_colaboraapp/src/utils/app_fonts.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../../src/utils/app_colors.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({super.key, required this.pokemon_data});

  final PokemonSimple pokemon_data;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  PokedexRepository repository = Modular.get<PokedexRepository>();

  late Pokemon pokemon;
  bool has_data = false;

  @override
  void initState() {
    fetchPokemon();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (has_data) {
          Modular.to.pushNamed('./details', arguments: pokemon);
        }
      },
      child: ShowUpAnimation(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Shimmer(
            enabled: !has_data,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ///Color A
                      has_data
                          ? pokemon.types[0].color.withLightness(0.4)
                          : Colors.grey[600]!.withOpacity(0.8),

                      ///

                      ///Color B
                      has_data
                          ? pokemon.types[0].color.withLightness(0.6)
                          : Colors.grey[600]!.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  if (has_data) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pokemon.name.capitalize(),
                          style: const AppFonts.medium(20, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          softWrap: false,
                        ),
                        Text(
                          '${pokemon.id}',
                          style: const AppFonts.medium(20, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            pokemon.types.length,
                            (index) {
                              return TypeTag(type: pokemon.types[index]);
                            },
                          ),
                        ),
                        Image.network(
                          pokemon.artwork_url,
                          height: 90,
                        ),
                      ],
                    ),
                  ] else ...[
                    Row(
                      children: [
                        Text(
                          widget.pokemon_data.name.capitalize(),
                          style: const AppFonts.medium(20, color: Colors.white),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchPokemon() async {
    await repository
        .getPokemonWithURL(widget.pokemon_data.url)
        .then((result) async {
      setState(() {
        pokemon = result;

        has_data = true;
      });
      pokemon.mainColor = await AppColors.pokemonMainColor(
        Image.network(pokemon.artwork_url).image,
      );
    }).onError((error, stackTrace) {
      //TODO insert error here
    });
  }
}
