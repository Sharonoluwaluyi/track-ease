import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../core/helpers/app_helpers.dart' show AppHelpers;
import 'onboarding_screen.dart' show OnboardingScreen;

class SplashScreen extends HookConsumerWidget {
  static final routeName = '/';
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          AppHelpers.goNamedReplacement(
              routeName: OnboardingScreen.routeName, context: context);
        }
      });
      return null;
    }, []);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            AppAssets.logo,
          ),
          SizedBox(height: .05.sh),
          Text(
            'Track Ease',
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w700,
              color: theme.primaryColor,
            ),
          ),
          SizedBox(height: .1.sh),
        ],
      ),
    );
  }
}
