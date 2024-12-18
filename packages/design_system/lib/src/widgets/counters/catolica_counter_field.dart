import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CatolicaCounterField extends StatelessWidget {
  final int value;
  final void Function(int value) onChanged;
  final int minValue;
  final int maxValue;
  final String? Function(int value)? validator;

  const CatolicaCounterField({
    super.key,
    required this.value,
    required this.onChanged,
    this.minValue = 0,
    this.maxValue = 100,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (_) => validator?.call(value),
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32,
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              border: Border.all(
                color: CatolicaColors.neutral200,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  onTap: () => _onChanged(value - 1),
                  child: const SizedBox(
                    height: 24,
                    width: 24,
                    child: CatolicaIcon(
                      size: 12,
                      icon: CatolicaIcons.minusSolid,
                      color: CatolicaColors.primary500,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    value.toString(),
                    style: context.texts.paragraphSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  onTap: () => _onChanged(value + 1),
                  child: const SizedBox(
                    height: 24,
                    width: 24,
                    child: CatolicaIcon(
                      size: 12,
                      icon: CatolicaIcons.plusSolid,
                      color: CatolicaColors.primary500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: field.hasError,
            child: Padding(
              padding: const EdgeInsets.only(top: 4, left: 12),
              child: Text(
                field.errorText ?? '',
                style: context.texts.paragraphXSmall.copyWith(
                  color: context.colors.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(int value) {
    if (value < minValue || value > maxValue) return;

    onChanged(value);
  }
}
