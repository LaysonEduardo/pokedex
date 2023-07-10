import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_model.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_simple_model.dart';
import 'package:pokedex_colaboraapp/src/repository/pokedex_repository.dart';
import 'package:pokedex_colaboraapp/src/utils/app_fonts.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';

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
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Text('test'),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.srcIn,
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              has_data ? pokemon.name.capitalize() : widget.pokemon_data.name,
              style: AppFonts.medium(20, color: Colors.grey[850]),
            ),
            if (has_data) ...[
              Image.network(
                pokemon.artwork_url,
                height: 100,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> fetchPokemon() async {
    await repository
        .getPokemonWithURL(widget.pokemon_data.url)
        .then((result) async {
      pokemon = result;
      pokemon.mainColor = await AppColors.pokemonMainColor(
          Image.network(pokemon.artwork_url).image);
      has_data = true;
      setState(() {});
    }).onError((error, stackTrace) {
      //TODO insert error here
    });
  }
}
