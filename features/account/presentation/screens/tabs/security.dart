import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../constants/change_data_enum.dart' show ChangeData;
import '../change_data_screen.dart' show ChangeDataScreen;

class Security extends HookWidget {
  const Security({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildRow(String label, Widget trailing, {bool isLast = false}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              trailing,
            ],
          ),
          if (!isLast) ...[
            SizedBox(height: 5.h),
            const Divider(color: Colors.white24),
          ]
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PASSWORD',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  AppHelpers.goNamed(
                      routeName: ChangeDataScreen.routeName,
                      context: context,
                      extra: ChangeData.password);
                },
                child: buildRow(
                  'Change Password',
                  isLast: true,
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
