import 'package:flutter/material.dart';

import '../../domain/enums/activity_status_enum.dart';

class ActivityStatusWidget extends StatelessWidget {
  final ActivityStatusEnum status;

  const ActivityStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: textColor,
        ),
        const SizedBox(width: 8),
        Text(
          status.toString(),
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  IconData get icon {
    // TODO: get icons from CatolicaIcons
    return switch (status) {
      ActivityStatusEnum.pending => Icons.pending_outlined,
      ActivityStatusEnum.aproved => Icons.check_circle_outline,
      ActivityStatusEnum.reproved => Icons.cancel_outlined,
    };
  }

  Color get textColor {
    // TODO: get colors from CatolicaColors
    return switch (status) {
      ActivityStatusEnum.pending => const Color(0xFFE0A800),
      ActivityStatusEnum.aproved => const Color(0xFF6AC973),
      ActivityStatusEnum.reproved => const Color(0xFFD32F2F),
    };
  }
}
