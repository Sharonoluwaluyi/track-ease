import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/svg_icon.dart' show SvgIcon;
import '../models/category_model.dart' show CategoryModel;
import '../screens/spend_screen.dart' show SpendScreen;

class CategoryWidget extends HookConsumerWidget {
  final CategoryModel category;

  const CategoryWidget({
    super.key,
    required this.category,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: (){
        AppHelpers.goNamed(routeName: SpendScreen.routeName, context: context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Row(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'No Transaction',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF989898)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
