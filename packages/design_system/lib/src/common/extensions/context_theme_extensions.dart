import 'package:flutter/material.dart';

import 'catolica_text_styles_extension.dart';

extension ContextThemeExtension on BuildContext {
  CatolicaTextStylesExtension get texts => Theme.of(this).extension<CatolicaTextStylesExtension>()!;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
