import 'package:flutter/material.dart';

import 'package:starter_template_get_x/data/data.dart';
import 'package:starter_template_get_x/config/config.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
      maxLines: maxLines,
    );
  }
}

class CustomNobelText extends StatelessWidget {
  const CustomNobelText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.nobelTextColor
                : DarkThemeColors.nobelTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
    );
  }
}

class CustomRhinoText extends StatelessWidget {
  const CustomRhinoText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.rhinoTextColor
                : DarkThemeColors.rhinoTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
    );
  }
}

class CustomBlueText extends StatelessWidget {
  const CustomBlueText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.blueTextColor
                : DarkThemeColors.blueTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
    );
  }
}

class CustomWildBlueText extends StatelessWidget {
  const CustomWildBlueText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w500,
    this.overflow,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    bool themeIsLight = MySharedPref.getThemeIsLight();

    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: themeIsLight
                ? LightThemeColors.wildBlueTextColor
                : DarkThemeColors.wildBlueTextColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class CustomWhiteText extends StatelessWidget {
  const CustomWhiteText({
    super.key,
    required this.text,
    this.fontSize = MyFonts.defaultFontSize,
    this.fontWeight = FontWeight.w300,
    this.overflow,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
          ),
    );
  }
}
