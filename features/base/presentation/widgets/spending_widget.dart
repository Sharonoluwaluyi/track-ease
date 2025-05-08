import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/svg_icon.dart' show SvgIcon;
import '../models/category_model.dart' show CategoryModel;
import '../screens/spending_chart_screen.dart' show SpendingChartScreen;

class SpendingWidget extends HookConsumerWidget {
  final CategoryModel category;
  final String amount;
  final String action;

  const SpendingWidget({
    super.key,
    required this.category,
    required this.amount,
    required this.action,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: (){
        AppHelpers.goNamed(routeName: SpendingChartScreen.routeName, context: context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              spacing: 10.r,
              children: <Widget>[
                Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: SvgIcon(icon: category.icon, width: 24.r, height: 24.r),
                ),
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: action == 'spent' ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
