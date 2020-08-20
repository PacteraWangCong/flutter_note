import 'package:flutter/material.dart';
import 'color_define.dart';

final hiraginoSans = 'HiraginoSans';
final helveticaNeueLight = 'HelveticaNeueLight';
final helveticaNeueRegular = 'HelveticaNeueRegular';

class TextStyles {
  /// bar
  static TextStyle barTitle = customBold(fontSize: 16, color: Colours.gray1);

  static TextStyle listContent = TextStyle(
    fontSize: 14,
    fontFamily: hiraginoSans,
    color: Colours.gray1,
  );

  static TextStyle linkText(double fontSize) {
    return custom(
      fontSize: fontSize,
      color: Colours.linkBlue,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
    );
  }

  /// custom

  static TextStyle customBold({
    double fontSize = 14,
    Color color = Colours.gray1,
    TextDecoration decoration = TextDecoration.none,
    TextDecorationStyle decorationStyle,
    TextBaseline textBaseline,
  }) {
    return custom(
      fontSize: fontSize,
      color: color,
      isBold: true,
      decoration: decoration,
      decorationStyle: decorationStyle,
      textBaseline: textBaseline,
    );
  }

  static TextStyle customNormal({
    double fontSize = 14,
    Color color = Colours.gray1,
    TextDecoration decoration = TextDecoration.none,
    TextDecorationStyle decorationStyle,
    TextBaseline textBaseline,
  }) {
    return custom(
      fontSize: fontSize,
      color: color,
      decoration: decoration,
      decorationStyle: decorationStyle,
      textBaseline: textBaseline,
    );
  }

  static TextStyle custom({
    double fontSize = 14,
    Color color = Colours.gray1,
    isBold = false,
    TextDecoration decoration = TextDecoration.none,
    TextDecorationStyle decorationStyle,
    TextBaseline textBaseline,
  }) {
    return TextStyle(
      fontFamily: hiraginoSans,
      fontSize: fontSize,
      color: color,
      fontWeight: isBold ? FontWeight.w600 : FontWeight.w300,
      decoration: decoration,
      decorationStyle: decorationStyle,
    );
  }
}
