import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constants/app_colors.dart' show AppColors;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../core/widgets/buttons.dart' show CustomRoundedButton;
import 'verification_successful_screen.dart' show VerificationSuccessfulScreen;

class VerifyScreen extends HookConsumerWidget {
  static final routeName = '/verify';
  const VerifyScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resending = useState(false);
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
            'Verification needed',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'A 5 digit code has been sent to your Email       ',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: .08.sh),
          Pinput(
            length: 5,
            defaultPinTheme: PinTheme(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
              ),
              width: 60.r,
              height: 60.r,
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Didn\'t receive code? ',
                style: TextStyle(
                  color: theme.textTheme.bodyMedium?.color,
                  fontSize: 14.sp,
                ),
              ),
              if (resending.value)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              else
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: CustomRoundedButton(
          text: 'Verify',
          onPressed: () {
            AppHelpers.goNamed(
                routeName: VerificationSuccessfulScreen.routeName,
                context: context);
          },
        ),
      ),
    );
  }
}
