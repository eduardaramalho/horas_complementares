import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../design_system.dart';

class CatolicaTextFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool enabled;
  final bool isRequired;
  final int? maxLength;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool hasCounter;
  final int? maxLines;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final AutovalidateMode autovalidateMode;
  final String? helperText;

  const CatolicaTextFormField({
    super.key,
    this.label,
    this.hint,
    this.enabled = true,
    this.isRequired = false,
    this.hasCounter = false,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.maxLines,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.initialValue,
    this.helperText,
    this.onChanged,
  });

  @override
  State<CatolicaTextFormField> createState() => _CatolicaTextFormFieldState();
}

class _CatolicaTextFormFieldState extends State<CatolicaTextFormField> {
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final CatolicaTextFormField(
      :label,
      :hint,
      :isRequired,
      :validator,
      :maxLength,
      :inputFormatters,
      :hasCounter,
      :keyboardType,
      :maxLines,
      :prefixIcon,
      :suffixIcon,
      :autovalidateMode,
      :initialValue,
      :helperText,
      :onChanged,
    ) = widget;

    const InputBorder defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: CatolicaColors.neutral200),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '$label${isRequired ? '*' : ''}',
              style: context.texts.paragraphSmall.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.enabled ? null : CatolicaColors.neutral500,
              ),
            ),
          ),
        ),
        TextFormField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          onFieldSubmitted: (value) => FocusManager.instance.primaryFocus?.nextFocus(),
          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          maxLines: maxLines,
          enabled: widget.enabled,
          autovalidateMode: autovalidateMode,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          validator: validator,
          style: context.texts.paragraphSmall,
          initialValue: initialValue,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.texts.paragraphSmall.copyWith(
              color: CatolicaColors.neutral400,
              overflow: TextOverflow.ellipsis,
            ),
            fillColor: widget.enabled ? Colors.white : CatolicaColors.neutral200,
            errorMaxLines: 2,
            errorStyle: context.texts.paragraphXSmall.copyWith(
              color: CatolicaColors.primary900,
            ),
            suffixIconConstraints: const BoxConstraints.tightFor(
              width: 30,
              height: 20,
            ),
            helperText: helperText,
            helperStyle: context.texts.paragraphSmall.copyWith(
              color: CatolicaColors.neutral600,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
                    child: prefixIcon,
                  )
                : null,
            counterText: hasCounter ? null : '',
            border: defaultBorder,
            enabledBorder: defaultBorder,
            focusedBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(
                color: CatolicaColors.primary500,
              ),
            ),
            errorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(
                color: CatolicaColors.neutral700,
              ),
            ),
            focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(
                color: CatolicaColors.neutral700,
              ),
            ),
            disabledBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(
                color: CatolicaColors.neutral300,
              ),
            ),
          ),
          buildCounter: _buildCounter,
        ),
      ],
    );
  }

  Widget? _buildCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) {
    if (!widget.hasCounter) return null;

    return _Counter(
      currentLength: currentLength,
      maxLength: maxLength,
    );
  }
}

class _Counter extends StatelessWidget {
  final int currentLength;
  final int? maxLength;

  const _Counter({
    required this.currentLength,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(10, -4, 0),
      child: Text(
        '$currentLength${maxLength != null ? '/$maxLength' : ''}',
        style: context.texts.paragraphXSmall,
      ),
    );
  }
}
