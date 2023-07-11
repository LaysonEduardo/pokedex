import 'package:flutter/material.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/fade_edges.dart';
import 'package:pokedex_colaboraapp/app/commom/widgets/space.dart';
import 'package:pokedex_colaboraapp/src/utils/app_fonts.dart';
import 'package:pokedex_colaboraapp/src/utils/poke_types.dart';

import 'type_select_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    super.key,
    required this.onSelect,
    this.currentType,
  });
  final PokemonType? currentType;
  final void Function(PokemonType?) onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: FadeEdges(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VSpace(10),
              const Text(
                'Select a type',
                style: AppFonts.medium(20),
              ),
              const VSpace(20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  PokemonType.values.length,
                  (index) {
                    return TypeSelectButton(
                      current: currentType,
                      button_value: PokemonType.values[index],
                      onSelect: onSelect,
                    );
                  },
                ),
              ),
              VSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
