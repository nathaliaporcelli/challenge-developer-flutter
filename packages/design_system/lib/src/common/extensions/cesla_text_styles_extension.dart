// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CelsaTextStylesExtension extends ThemeExtension<CelsaTextStylesExtension> {
  final TextStyle title;
  final TextStyle header;
  final TextStyle subHeader;
  final TextStyle label;
  final TextStyle darkLabel;
  final TextStyle caption;

  CelsaTextStylesExtension({
    required this.title,
    required this.header,
    required this.subHeader,
    required this.label,
    required this.darkLabel,
    required this.caption,
  });

  @override
  CelsaTextStylesExtension copyWith({
    TextStyle? title,
    TextStyle? header,
    TextStyle? subHeader,
    TextStyle? label,
    TextStyle? darkLabel,
    TextStyle? caption,
  }) {
    return CelsaTextStylesExtension(
      title: title ?? this.title,
      header: header ?? this.header,
      subHeader: subHeader ?? this.subHeader,
      label: label ?? this.label,
      darkLabel: darkLabel ?? this.darkLabel,
      caption: caption ?? this.caption,
    );
  }

  @override
  ThemeExtension<CelsaTextStylesExtension> lerp(covariant ThemeExtension<CelsaTextStylesExtension>? other, double t) {
    return this;
  }
}
