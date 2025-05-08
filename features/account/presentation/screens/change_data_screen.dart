import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/change_data_enum.dart' show ChangeData;
import 'sections/change_password_section.dart' show ChangePasswordSection;
import 'sections/change_phone_number_section.dart'
    show ChangePhoneNumberSection;

class ChangeDataScreen extends HookConsumerWidget {
  static const routeName = '/change-data';
  final ChangeData changeData;

  const ChangeDataScreen({super.key, required this.changeData});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Builder(
          builder: (context) {
            if (changeData == ChangeData.phoneNumber) {
              return ChangePhoneNumberSection();
            }
            return ChangePasswordSection();
          },
        ),
      ),
    );
  }
}
