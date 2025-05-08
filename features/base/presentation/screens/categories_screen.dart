import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart' show AppColors;
import '../constants/app_categories.dart' show AppCategories;
import '../widgets/category_widget.dart' show CategoryWidget;

class CategoriesScreen extends HookConsumerWidget {
  static const routeName = '/categories';
  const CategoriesScreen({super.key});
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
          'Categories',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        separatorBuilder: (context, index) => SizedBox(height: 10.r),
        itemBuilder: (context, index) => CategoryWidget(
          category: AppCategories.all[index],
        ),
        itemCount: AppCategories.all.length,
      ),
    );
  }
}
