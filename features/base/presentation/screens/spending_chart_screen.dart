import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart' show AppColors;
import '../constants/app_categories.dart' show AppCategories;
import '../widgets/spending_chart_widget.dart' show SpendingChartCard;
import '../widgets/spending_widget.dart' show SpendingWidget;

class SpendingChartScreen extends HookConsumerWidget {
  static const routeName = '/spending-chart';
  const SpendingChartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: (!Navigator.canPop(context))
            ? null
            : Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 33.r,
                    height: 33.r,
                    decoration: BoxDecoration(
                        color: AppColors.grey2, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                ),
              ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'General',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        children: [
          SpendingChartCard(),
          SizedBox(height: 10.h),
          Text(
            'All Transactions',
            style: TextStyle(
              fontSize: 16.sp,
              color: Color(0xFF404040),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            height: .4.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFF404040),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                SpendingWidget(
                  category: AppCategories.general,
                  amount: '-£1000',
                  action: 'spent',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
