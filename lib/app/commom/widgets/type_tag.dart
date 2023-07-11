import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/space.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';
import 'package:pokedex_colaboraapp/src/utils/poke_types.dart';
import '../../../src/utils/app_fonts.dart';

class TypeTag extends StatelessWidget {
  const TypeTag({super.key, required this.type});

  final PokemonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 10),
      width: 75,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: type.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              type.image_path,
              height: 10,
            ),
          ),
          const HSpace(5),
          Text(
            type.name.capitalize(),
            style: const AppFonts.medium(
              10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
