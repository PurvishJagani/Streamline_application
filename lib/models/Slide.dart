import 'package:flutter/material.dart';

class Slide {
  final String title;
  final String description;
  final String image;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsets? margin;
  final Color? backgroundColor;

  Slide({
    required this.title,
    required this.description,
    required this.image,
    this.titleStyle,
    this.descriptionStyle,
    this.margin,
    this.backgroundColor,
  });
}
