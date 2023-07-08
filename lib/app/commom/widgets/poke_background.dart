import 'package:flutter/material.dart';

class PokeBackground extends StatelessWidget {
  const PokeBackground({super.key, required this.child, required this.accent});
  final Color accent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [accent, Colors.grey[400]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/logo/pokeball_white.png',
            opacity: const AlwaysStoppedAnimation(.15),
          ),
          child,
        ],
      ),
    );
  }
}
