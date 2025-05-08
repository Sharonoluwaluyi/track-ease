import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/widgets/buttons.dart' show CustomRoundedButton;
import '../../../../../core/widgets/custom_textfield.dart' show CustomTextfield;

class ChangePasswordSection extends HookConsumerWidget {
  const ChangePasswordSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = ScreenUtil().screenWidth;
    final typed = useState(false);
    final typed2 = useState(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: .05.sh),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Change your password to a new one',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                hintText: 'Current Password',
                obscureText: true,
                filled: true,
                fillColor: const Color(0xFF222222),
                fontSize: 10.sp,
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    typed.value = true;
                  } else {
                    typed.value = false;
                  }
                },
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              SizedBox(height: 10.h),
              CustomTextfield(
                hintText: 'New Password',
                obscureText: true,
                filled: true,
                fillColor: const Color(0xFF222222),
                fontSize: 10.sp,
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    typed2.value = true;
                  } else {
                    typed2.value = false;
                  }
                },
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                spacing: 10.r,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.r),
                    decoration: BoxDecoration(
                      color: Color(0xFF3E3A4D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'alphanumeric characters',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.r),
                    decoration: BoxDecoration(
                      color: Color(0xFF3E3A4D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '1 special character',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.r),
                    decoration: BoxDecoration(
                      color: Color(0xFF3E3A4D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'more than 7 character',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 6.r),
                    decoration: BoxDecoration(
                      color: Color(0xFF3E3A4D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '1 capital letter',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        BottomAppBar(
          notchMargin: 10,
          child: SizedBox(
            width: width,
            child: CustomRoundedButton(
              text: 'Change Password',
              onPressed: () {},
              btnColor: !typed2.value || !typed.value ? Color(0xFFA5A3A6) : null,
            ),
          ),
        ),
      ],
    );
  }
}
