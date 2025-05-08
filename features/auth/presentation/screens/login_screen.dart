import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/constants/app_colors.dart' show AppColors;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/buttons.dart'
    show CustomOutlinedRoundedIconButton, CustomRoundedButton;
import '../../../../core/widgets/custom_textfield.dart' show CustomTextfield;
import '../../../base/presentation/screens/home_screen.dart' show HomeScreen;
import 'forgotten_password_screen.dart' show ForgottenPasswordScreen;
import 'sign_up_screen.dart' show SignUpScreen;

class LoginScreen extends HookConsumerWidget {
  static final routeName = '/login';
  const LoginScreen({super.key});
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
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        children: [
          Text(
            'Log In',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Login into your account!',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextfield(
            title: 'Email Address',
          ),
          SizedBox(height: 20.h),
          CustomTextfield(
            title: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                AppHelpers.goNamed(
                    routeName: ForgottenPasswordScreen.routeName,
                    context: context);
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          CustomRoundedButton(
            text: 'Sign In',
            onPressed: () {
              AppHelpers.goNamedReplacement(routeName: HomeScreen.routeName, context: context);
            },
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              'Or',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          CustomOutlinedRoundedIconButton(
            icon: Image.asset(
              AppAssets.google,
              width: 12.r,
              height: 12.r,
            ),
            btnColor: AppColors.grey,
            onPressed: () {},
            text: 'Sign In with Google',
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        AppHelpers.goNamed(
                            routeName: SignUpScreen.routeName,
                            context: context);
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
