import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_colaboraapp/src/utils/app_colors.dart';
import 'package:pokedex_colaboraapp/src/utils/app_strings.dart';

import '../../../../src/utils/app_fonts.dart';
import '../../../../src/utils/poke_types.dart';
import '../../../commom/widgets/space.dart';

class TypeSelectButton extends StatelessWidget {
  const TypeSelectButton({
    super.key,
    required this.button_value,
    required this.current,
    required this.onSelect,
  });
  final PokemonType button_value;
  final PokemonType? current;
  final void Function(PokemonType?) onSelect;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            return button_value.color.withLightness(0.3);
          }),
        ),
      ),
      child: SizedBox(
        width: 125,
        child: RadioMenuButton(
          value: button_value,
          groupValue: current,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              button_value.color,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          toggleable: true,
          onChanged: onSelect,
          child: Row(
            children: [
              SvgPicture.asset(
                button_value.image_path,
                height: 20,
                // ignore: deprecated_member_use
                color: Colors.grey[850],
              ),
              const HSpace(10),
              Text(
                button_value.name.capitalize(),
                style: AppFonts.medium(10, color: Colors.grey[850]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
