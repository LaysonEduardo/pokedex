import 'package:flutter/material.dart';

class PokeLoading extends StatelessWidget {
  const PokeLoading({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: size,
      child: Image.asset('assets/loading/poke_loading.gif'),
    );
  }
}
