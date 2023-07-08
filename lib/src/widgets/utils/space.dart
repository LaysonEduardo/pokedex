import 'package:flutter/material.dart';

class _Space extends StatelessWidget {
  final double size;
  final Axis direction;

  const _Space.vertical(this.size) : direction = Axis.vertical;

  const _Space.horizontal(this.size) : direction = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case Axis.vertical:
        return SizedBox(height: size);
      case Axis.horizontal:
        return SizedBox(width: size);
    }
  }
}

class VSpace extends _Space {
  const VSpace(double space) : super.vertical(space);
}

class HSpace extends _Space {
  const HSpace(double space) : super.horizontal(space);
}
