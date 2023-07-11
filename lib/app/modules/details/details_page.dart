import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/poke_background.dart';
import 'package:pokedex_colaboraapp/src/models/pokemon/pokemon_model.dart';
import 'package:pokedex_colaboraapp/src/utils/app_colors.dart';
import 'package:pokedex_colaboraapp/src/utils/app_fonts.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemon.name.capitalize(),
              style: const AppFonts.medium(20, color: Colors.white),
            ),
            Text(
              '#${pokemon.id}',
              style: const AppFonts.medium(20, color: Colors.white),
            ),
          ],
        ),
      ),
      body: PokeBackground(
        accent: pokemon.types[0].color,
        child: Center(
          child: Image.network(pokemon.artwork_url),
        ),
      ),
    );
  }
}
