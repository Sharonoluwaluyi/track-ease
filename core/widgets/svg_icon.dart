import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Color? color;
  const SvgIcon(
      {super.key, required this.icon, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width,
      height: height,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
    );
  }
}
