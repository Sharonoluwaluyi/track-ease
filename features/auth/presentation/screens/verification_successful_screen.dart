import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/buttons.dart' show CustomRoundedButton;
import '../../../../core/widgets/svg_icon.dart' show SvgIcon;
import 'change_password_screen.dart' show ChangePasswordScreen;

class VerificationSuccessfulScreen extends HookConsumerWidget {
  static final routeName = '/verification-successful';
  const VerificationSuccessfulScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = ScreenUtil().screenWidth;
    double height = ScreenUtil().screenHeight;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              icon: AppAssets.check,
            ),
            SizedBox(height: 10.h),
            Text(
              'The Verification was Successful! ',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: CustomRoundedButton(
          text: 'Verify',
          onPressed: () {
            AppHelpers.goNamed(
                routeName: ChangePasswordScreen.routeName,
                context: context);
          },
        ),
      ),
    );
  }
}
