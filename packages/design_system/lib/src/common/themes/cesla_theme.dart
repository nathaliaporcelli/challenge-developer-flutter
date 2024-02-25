import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/cesla_color_scheme.dart';
import '../extensions/cesla_text_styles_extension.dart';

class CeslaTheme {
  static ThemeData get() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const CeslaColorScheme(),
      extensions: [
        CeslaTextStylesExtension(
          title: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.normal,
            color: CeslaThemeColors.black,
          ),
          header: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: CeslaThemeColors.black,
          ),
          subHeader: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: CeslaThemeColors.black,
          ),
          label: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: CeslaThemeColors.black,
          ),
          caption: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: CeslaThemeColors.black,
          ),
        ),
      ],
    );
  }
}
