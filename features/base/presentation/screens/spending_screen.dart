import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart' show AppColors;
import '../constants/app_categories.dart' show AppCategories;
import '../widgets/spending_widget.dart' show SpendingWidget;

class SpendingScreen extends HookConsumerWidget {
  static const routeName = '/spending';
  const SpendingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          'All Spending',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        children: <Widget>[
          Text(
            'Yesterday',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF979797)),
          ),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.general,
              amount: '-£100',
              action: 'spent'),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.eatingOut,
              amount: '-£100',
              action: 'spent'),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.transport,
              amount: '-£100',
              action: 'spent'),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.transport,
              amount: '-£100',
              action: 'spent'),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.groceries,
              amount: '-£100',
              action: 'spent'),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.eatingOut,
              amount: '-£100',
              action: 'spent'),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.transport,
              amount: '-£100',
              action: 'spent'),
          SizedBox(height: 10.h),
          SpendingWidget(
              category: AppCategories.income,
              amount: '+£200',
              action: 'funded'),
        ],
      ),
    );
  }
}
