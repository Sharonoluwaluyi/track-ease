import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart' show AppColors;
import '../../../../core/widgets/buttons.dart' show CustomRoundedButton;
import '../../../../core/widgets/custom_textfield.dart' show CustomTextfield;

class SpendScreen extends HookConsumerWidget {
  static const routeName = '/spend';
  const SpendScreen({super.key});
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
          'General',
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
            'Save Transaction',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF989898),
            ),
          ),
          SizedBox(height: 5.h),
          CustomTextfield(
            title: 'Amount',
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 10.h),
          Text(
            'Transactions in this category will be \ncounted as Spending. ',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF989898),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: CustomRoundedButton(
          text: 'Save',
          onPressed: () {},
        ),
      ),
    );
  }
}
