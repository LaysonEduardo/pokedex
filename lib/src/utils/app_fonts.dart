import 'package:flutter/material.dart';

class AppFonts extends TextStyle {
  const AppFonts.black(
    double size, {
    Color? color,
    double? height,
    TextDecoration? decoration,
    List<Shadow>? shadows,
  }) : super(
          fontSize: size,
          color: color ?? Colors.black,
          fontFamily: 'Roboto',
          height: height,
          decoration: decoration,
          shadows: shadows,
          fontWeight: FontWeight.w900,
        );

  const AppFonts.medium(
    double size, {
    Color? color,
    double? height,
    TextDecoration? decoration,
    List<Shadow>? shadows,
  }) : super(
          fontSize: size,
          color: color ?? Colors.black,
          fontFamily: 'Roboto',
          height: height,
          decoration: decoration,
          shadows: shadows,
          fontWeight: FontWeight.w700,
        );

  const AppFonts.bold(
    double size, {
    Color? color,
    double? height,
    TextDecoration? decoration,
    List<Shadow>? shadows,
  }) : super(
          fontSize: size,
          color: color ?? Colors.black,
          fontFamily: 'Roboto',
          height: height,
          decoration: decoration,
          shadows: shadows,
          fontWeight: FontWeight.w900,
        );

  const AppFonts.regular(
    double size, {
    Color? color,
    double? height,
    TextDecoration? decoration,
    List<Shadow>? shadows,
  }) : super(
          fontSize: size,
          color: color ?? Colors.black,
          fontFamily: 'Roboto',
          height: height,
          decoration: decoration,
          shadows: shadows,
          fontWeight: FontWeight.w500,
        );
}
