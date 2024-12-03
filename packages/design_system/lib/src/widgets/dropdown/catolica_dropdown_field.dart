import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CatolicaDropdownField<T> extends StatefulWidget {
  final String? label;
  final String? hint;
  final List<T> items;
  final T? initialValue;
  final bool enabled;
  final bool isRequired;
  final ValueChanged<T>? onChanged;

  const CatolicaDropdownField({
    super.key,
    this.label,
    this.hint,
    required this.items,
    this.initialValue,
    this.enabled = true,
    this.isRequired = false,
    this.onChanged,
  });

  @override
  State<CatolicaDropdownField<T>> createState() => _CatolicaDropdownFieldState<T>();
}

class _CatolicaDropdownFieldState<T> extends State<CatolicaDropdownField<T>> {
  T? selectedValue;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '${widget.label}${widget.isRequired ? '*' : ''}',
              style: context.texts.paragraphSmall.copyWith(
                fontWeight: FontWeight.bold,
                color: widget.enabled ? null : CatolicaColors.neutral500,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                height: _dropdownHeight,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: widget.enabled ? CatolicaColors.neutral200 : CatolicaColors.neutral300,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () => setState(() => isExpanded = !isExpanded),
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _dropdownLabel,
                                  style: context.texts.paragraphSmall.copyWith(
                                    color: CatolicaColors.neutral400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              AnimatedRotation(
                                duration: const Duration(milliseconds: 150),
                                turns: isExpanded ? -1 / 2 : 0,
                                child: const CatolicaIcon(
                                  size: 18,
                                  icon: CatolicaIcons.chevronDownSolid,
                                  color: CatolicaColors.primary500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.items.length,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          separatorBuilder: (context, index) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final item = widget.items[index];

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedValue = item;
                                  isExpanded = false;
                                });

                                widget.onChanged?.call(item);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                height: 36,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: selectedValue == item
                                      ? CatolicaColors.neutral100
                                      : CatolicaColors.neutral100.withOpacity(0),
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(
                                    color: CatolicaColors.neutral200,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Expanded(
                                    child: Text(
                                      item.toString(),
                                      style: context.texts.paragraphSmall.copyWith(
                                        color: CatolicaColors.neutral900,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String get _dropdownLabel {
    if (selectedValue != null) return selectedValue.toString();
    return widget.hint ?? '';
  }

  double get _dropdownHeight {
    const double closedHeight = 48;

    final itensHeight = widget.items.length * 36;
    final itensPadding = ((widget.items.length - 1) + 2) * 8;

    final expandedHeight = closedHeight + itensHeight + itensPadding;

    return isExpanded ? expandedHeight : closedHeight;
  }
}
