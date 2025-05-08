import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/svg_icon.dart' show SvgIcon;

class DrawerIconButton extends StatelessWidget {
  final String icon;
  final String name;
  final double? width;
  final double? height;
  final void Function() onTap;
  const DrawerIconButton(
      {super.key,
      required this.icon,
      required this.name,
      required this.onTap,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 10.r,
        children: <Widget>[
          SvgIcon(
            icon: icon,
            width: width ?? 24.r,
            height: height ?? 24.r,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
