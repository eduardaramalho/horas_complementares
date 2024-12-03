import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants/catolica_icons.dart';

class CatolicaIcon extends StatelessWidget {
  final CatolicaIcons icon;
  final BoxFit fit;
  final Color? color;
  final double size;
  final Function()? onTap;
  final BorderRadius inkBorderRadius;

  const CatolicaIcon({
    super.key,
    required this.icon,
    this.fit = BoxFit.contain,
    this.color,
    this.size = 24,
    this.onTap,
    this.inkBorderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: inkBorderRadius,
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: SvgPicture.asset(
              icon.path,
              fit: fit,
              colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
              // width: size,
              // height: size,
            ),
          ),
        ),
      ),
    );
  }
}
