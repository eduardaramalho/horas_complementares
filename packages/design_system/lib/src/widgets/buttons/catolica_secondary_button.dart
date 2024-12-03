import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CatolicaSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CatolicaSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(context.colors.surface),
                textStyle: WidgetStateProperty.all(
                  context.texts.paragraphSmall.copyWith(
                    color: CatolicaColors.neutral900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(color: CatolicaColors.neutral900),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
