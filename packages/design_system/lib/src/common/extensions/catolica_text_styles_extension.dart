import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/catolica_colors.dart';

class CatolicaTextStylesExtension extends ThemeExtension<CatolicaTextStylesExtension> {
  final TextStyle headingH1;
  final TextStyle headingH2;
  final TextStyle headingH3;
  final TextStyle headingH4;
  final TextStyle headingH5;
  final TextStyle headingH6;

  final TextStyle paragraphLarge;
  final TextStyle paragraphMedium;
  final TextStyle paragraphSmall;
  final TextStyle paragraphXSmall;

  CatolicaTextStylesExtension({
    required this.headingH1,
    required this.headingH2,
    required this.headingH3,
    required this.headingH4,
    required this.headingH5,
    required this.headingH6,
    required this.paragraphLarge,
    required this.paragraphMedium,
    required this.paragraphSmall,
    required this.paragraphXSmall,
  });

  static CatolicaTextStylesExtension get() {
    return CatolicaTextStylesExtension(
      headingH1: GoogleFonts.inter(
        fontSize: 40,
        height: 1.1,
        fontWeight: FontWeight.w800,
        color: CatolicaColors.neutral900,
        letterSpacing: -0.02 * 36,
      ),
      headingH2: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
        letterSpacing: -0.02 * 32,
      ),
      headingH3: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
        letterSpacing: -0.02 * 28,
      ),
      headingH4: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
        letterSpacing: -0.02 * 24,
      ),
      headingH5: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
        letterSpacing: -0.02 * 20,
      ),
      headingH6: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
        letterSpacing: -0.02 * 18,
      ),
      paragraphLarge: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
      ),
      paragraphMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
      ),
      paragraphSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
      ),
      paragraphXSmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: CatolicaColors.neutral900,
      ),
    );
  }

  @override
  CatolicaTextStylesExtension copyWith({
    TextStyle? headingH1,
    TextStyle? headingH2,
    TextStyle? headingH3,
    TextStyle? headingH4,
    TextStyle? headingH5,
    TextStyle? headingH6,
    TextStyle? paragraphLarge,
    TextStyle? paragraphMedium,
    TextStyle? paragraphSmall,
    TextStyle? paragraphXSmall,
  }) {
    return CatolicaTextStylesExtension(
      headingH1: headingH1 ?? this.headingH1,
      headingH2: headingH2 ?? this.headingH2,
      headingH3: headingH3 ?? this.headingH3,
      headingH4: headingH4 ?? this.headingH4,
      headingH5: headingH5 ?? this.headingH5,
      headingH6: headingH6 ?? this.headingH6,
      paragraphLarge: paragraphLarge ?? this.paragraphLarge,
      paragraphMedium: paragraphMedium ?? this.paragraphMedium,
      paragraphSmall: paragraphSmall ?? this.paragraphSmall,
      paragraphXSmall: paragraphXSmall ?? this.paragraphXSmall,
    );
  }

  @override
  ThemeExtension<CatolicaTextStylesExtension> lerp(
    covariant ThemeExtension<CatolicaTextStylesExtension>? other,
    double t,
  ) {
    return this;
  }
}
