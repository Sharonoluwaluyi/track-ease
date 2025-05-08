import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/widgets/svg_icon.dart' show SvgIcon;

class BalanceWidget extends StatelessWidget {
  final String balance;
  final String message;
  const BalanceWidget(
      {super.key, required this.balance, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 150.r,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  balance,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.r,
            right: 10.r,
            child: SvgIcon(
              icon: AppAssets.chart,
              width: 18.r,
              height: 19.r,
            ),
          ),
        ],
      ),
    );
  }
}
