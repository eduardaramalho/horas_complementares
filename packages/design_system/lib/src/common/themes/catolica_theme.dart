import 'package:flutter/material.dart';

import '../colors/catolica_color_scheme.dart';
import '../extensions/catolica_text_styles_extension.dart';

class CatolicaTheme {
  static ThemeData get() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const CatolicaColorScheme(),
      extensions: [
        CatolicaTextStylesExtension.get(),
      ],
    );
  }
}
