import 'package:flutter/material.dart';

class CeslaTextStylesExtension extends ThemeExtension<CeslaTextStylesExtension> {
  final TextStyle title;
  final TextStyle header;
  final TextStyle subHeader;
  final TextStyle label;
  final TextStyle darkLabel;
  final TextStyle caption;

  CeslaTextStylesExtension({
    required this.title,
    required this.header,
    required this.subHeader,
    required this.label,
    required this.darkLabel,
    required this.caption,
  });

  @override
  CeslaTextStylesExtension copyWith({
    TextStyle? title,
    TextStyle? header,
    TextStyle? subHeader,
    TextStyle? label,
    TextStyle? darkLabel,
    TextStyle? caption,
  }) {
    return CeslaTextStylesExtension(
      title: title ?? this.title,
      header: header ?? this.header,
      subHeader: subHeader ?? this.subHeader,
      label: label ?? this.label,
      darkLabel: darkLabel ?? this.darkLabel,
      caption: caption ?? this.caption,
    );
  }

  @override
  ThemeExtension<CeslaTextStylesExtension> lerp(covariant ThemeExtension<CeslaTextStylesExtension>? other, double t) {
    return this;
  }
}
