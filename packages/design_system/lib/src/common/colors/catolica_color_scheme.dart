import 'package:flutter/material.dart';

import '../constants/catolica_colors.dart';

class CatolicaColorScheme extends ColorScheme {
  const CatolicaColorScheme({
    super.brightness = Brightness.dark,
    super.primary = CatolicaColors.primary500,
    super.onPrimary = CatolicaColors.white,
    super.secondary = CatolicaColors.white,
    super.onSecondary = CatolicaColors.white,
    super.error = CatolicaColors.error,
    super.onError = CatolicaColors.white,
    super.background = CatolicaColors.white,
    super.onBackground = CatolicaColors.primary900,
    super.surface = CatolicaColors.white,
    super.onSurface = CatolicaColors.primary900,
    super.surfaceVariant = CatolicaColors.white,
  });
}
