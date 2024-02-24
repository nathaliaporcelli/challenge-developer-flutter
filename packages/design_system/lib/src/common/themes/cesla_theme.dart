import 'package:design_system/src/common/colors/cesla_color_scheme.dart';
import 'package:design_system/src/common/extensions/cesla_text_styles_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CelsaTheme {
  static ThemeData get() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const CelsaColorScheme(),
      extensions: [
        CelsaTextStylesExtension(
          title: GoogleFonts.inter(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: CelsaThemeColors.black,
          ),
          header: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CelsaThemeColors.black,
          ),
          subHeader: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CelsaThemeColors.black,
          ),
          label: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: CelsaThemeColors.black,
          ),
          darkLabel: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: CelsaThemeColors.black,
          ),
          caption: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: CelsaThemeColors.black,
          ),
        ),
      ],
    );
  }
}
