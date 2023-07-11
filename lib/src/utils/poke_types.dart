import 'package:flutter/material.dart';

enum PokemonType {
  normal,
  fire,
  flying,
  psychic,
  water,
  bug,
  grass,
  rock,
  electric,
  ghost,
  ice,
  dark,
  fighting,
  dragon,
  poison,
  steel,
  ground,
  fairy;

  Color get color => switch (this) {
        normal => const Color(0xffa8a878),
        fire => const Color(0xfff08030),
        flying => const Color(0xffa890f0),
        psychic => const Color(0xfff85888),
        water => const Color(0xff6890f0),
        bug => const Color(0xffa8b820),
        grass => const Color(0xff78c850),
        rock => const Color(0xffb8a038),
        electric => const Color(0xfff8d030),
        ghost => const Color(0xff705898),
        ice => const Color(0xff98d8d8),
        dark => const Color(0xff705848),
        fighting => const Color(0xffc03028),
        dragon => const Color(0xff7038f8),
        poison => const Color(0xffa040a0),
        steel => const Color(0xfff2f2f2),
        ground => const Color(0xffe0c068),
        fairy => const Color(0xfff0b6bc),
      };

  String get image_path => 'assets/icons/$name.svg';
}
