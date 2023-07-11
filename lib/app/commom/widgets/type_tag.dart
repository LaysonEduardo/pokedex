import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';
import 'package:pokedex_colaboraapp/src/utils/poke_types.dart';
import '../../../src/utils/app_fonts.dart';

class TypeTag extends StatelessWidget {
  const TypeTag({
    super.key,
    required this.type,
    this.width = 75,
    this.fontSize = 10,
    this.imageHeight = 10,
  });
  final double width;
  final double fontSize;
  final double imageHeight;
  final PokemonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 10, right: 10),
      width: width,
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
              height: imageHeight,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  type.name.capitalize(),
                  style: AppFonts.medium(
                    fontSize,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
