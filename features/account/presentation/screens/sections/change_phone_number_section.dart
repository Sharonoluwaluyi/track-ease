import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/widgets/buttons.dart' show CustomRoundedButton;
import '../../../../../core/widgets/custom_textfield.dart' show CustomTextfield;

class ChangePhoneNumberSection extends HookConsumerWidget {
  const ChangePhoneNumberSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = ScreenUtil().screenWidth;
    final typed = useState(false);
    final phoneNumberController =
        useTextEditingController(text: '+44444444444');
    useEffect(() {
      if (phoneNumberController.text.trim().isNotEmpty) {
        typed.value = true;
      } else {
        typed.value = false;
      }
      return;
    }, []);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: .05.sh),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Change your Phone Number',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                controller: phoneNumberController,
                hintText: 'new Phone Number',
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
            ],
          ),
        ),
        BottomAppBar(
          notchMargin: 10,
          child: SizedBox(
            width: width,
            child: CustomRoundedButton(
              text: 'Change Phone Number',
              onPressed: () {},
              btnColor: !typed.value ? Color(0xFFA5A3A6) : null,
            ),
          ),
        ),
      ],
    );
  }
}
