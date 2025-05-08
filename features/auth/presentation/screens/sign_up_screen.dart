import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/constants/app_colors.dart' show AppColors;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/buttons.dart'
    show CustomOutlinedRoundedIconButton, CustomRoundedButton;
import '../../../../core/widgets/custom_textfield.dart' show CustomTextfield;
import '../../../base/presentation/screens/home_screen.dart' show HomeScreen;
import 'login_screen.dart' show LoginScreen;

class SignUpScreen extends HookConsumerWidget {
  static final routeName = '/sign-up';
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isChecked = useState(false);
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
        actions: [
          TextButton(
            onPressed: () {
              AppHelpers.goNamed(
                  routeName: LoginScreen.routeName, context: context);
            },
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        children: [
          Text(
            'Register Your Account',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Track your expenses with us! 👋',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            spacing: 10.r,
            children: <Widget>[
              Expanded(
                child: CustomTextfield(
                  title: 'First Name',
                ),
              ),
              Expanded(
                child: CustomTextfield(
                  title: 'Last Name',
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomTextfield(
            title: 'Username',
          ),
          SizedBox(height: 10.h),
          CustomTextfield(
            title: 'Email Address',
          ),
          SizedBox(height: 10.h),
          CustomTextfield(
            title: 'Password',
            obscureText: true,
          ),
          SizedBox(height: 10.h),
          CustomTextfield(
            title: 'Confirm Password',
            obscureText: true,
          ),
          SizedBox(height: 10.h),
          Row(
            children: <Widget>[
              Checkbox(
                value: isChecked.value,
                onChanged: (value) {
                  isChecked.value = !isChecked.value;
                },
              ),
              Expanded(
                child: Text.rich(
                  softWrap: true,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: theme.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policies',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomRoundedButton(
            text: 'Sign Up',
            onPressed: () {
              AppHelpers.goNamedReplacement(
                  routeName: HomeScreen.routeName, context: context);
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
            text: 'Sign Up with Google',
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    );
  }
}
