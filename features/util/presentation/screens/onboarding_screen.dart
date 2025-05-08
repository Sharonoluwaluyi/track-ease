import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/buttons.dart' show CustomRoundedButton;
import '../../../auth/presentation/screens/login_screen.dart' show LoginScreen;

class OnboardingScreen extends HookConsumerWidget {
  static final routeName = '/onboarding';
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = ScreenUtil().screenWidth;
    double height = ScreenUtil().screenHeight;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.card,
            ),
            SizedBox(height: 10.h),
            Text(
              'See how you\'re really spending with our categories just for you',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.h),
            Text(
              'Create your own spending category for whatever \nyou\'d like.',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: CustomRoundedButton(
          text: 'Continue',
          onPressed: () {
            AppHelpers.goNamed(
                routeName: LoginScreen.routeName, context: context);
          },
        ),
      ),
    );
  }
}
