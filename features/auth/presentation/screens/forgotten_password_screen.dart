import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_colors.dart' show AppColors;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/buttons.dart'
    show CustomRoundedButton;
import '../../../../core/widgets/custom_textfield.dart' show CustomTextfield;
import 'verify_screen.dart' show VerifyScreen;

class ForgottenPasswordScreen extends HookConsumerWidget {
  static final routeName = '/forgotten-password';
  const ForgottenPasswordScreen({super.key});
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
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        children: [
          Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: .05.sh),
          CustomTextfield(
            title: 'Email Address',
          ),
          
          SizedBox(height: .1.sh),
          CustomRoundedButton(
            text: 'Submit',
            onPressed: () {
              AppHelpers.goNamed(routeName: VerifyScreen.routeName, context: context);
            },
          ),
        ],
      ),
    );
  }
}
