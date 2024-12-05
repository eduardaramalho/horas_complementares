import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CatolicaPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const CatolicaPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
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
                elevation: WidgetStateProperty.all(0),
                backgroundColor: WidgetStateProperty.all(context.colors.primary),
                textStyle: WidgetStateProperty.all(
                  context.texts.paragraphSmall.copyWith(
                    color: CatolicaColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: CatolicaColors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(label, style: const TextStyle(color: CatolicaColors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
