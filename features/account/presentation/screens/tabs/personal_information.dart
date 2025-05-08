import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_assets.dart' show AppAssets;
import '../../../../../core/helpers/app_helpers.dart' show AppHelpers;
import '../../../../../core/widgets/svg_icon.dart' show SvgIcon;
import '../../constants/change_data_enum.dart' show ChangeData;
import '../change_data_screen.dart' show ChangeDataScreen;

class PersonalInformation extends HookWidget {
  final bool isEditable;
  final void Function(bool value) editToggle;

  const PersonalInformation({
    super.key,
    required this.isEditable,
    required this.editToggle,
  });

  @override
  Widget build(BuildContext context) {
    final firstNameController = useTextEditingController(text: 'Sharon');
    final lastNameController = useTextEditingController(text: 'Oluwaluyi');
    final emailController =
        useTextEditingController(text: 'Sharonoluwaluyi4@gmail.com');
    final theme = Theme.of(context);
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

    Widget buildField({
      required String label,
      required TextEditingController controller,
      required IconData icon,
      required bool editable,
    }) {
      return buildRow(
        label,
        editable
            ? Expanded(
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(icon, color: Colors.white),
                ],
              ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PERSONAL INFORMATION',
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
              buildField(
                label: 'First Name',
                controller: firstNameController,
                icon: Icons.lock_outline,
                editable: isEditable,
              ),
              buildField(
                label: 'Last Name',
                controller: lastNameController,
                icon: Icons.lock_outline,
                editable: isEditable,
              ),
              buildField(
                label: 'Email',
                controller: emailController,
                icon: Icons.lock_outline,
                editable: isEditable,
              ),
              InkWell(
                onTap: () {
                  AppHelpers.goNamed(
                      routeName: ChangeDataScreen.routeName,
                      context: context,
                      extra: ChangeData.phoneNumber);
                },
                child: buildRow(
                  'Phone',
                  isLast: true,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+44444444444',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: isEditable
                ? null
                : () {
                    editToggle(isEditable);
                  },
            label: Text(
               'Edit',
              style: TextStyle(
                  color: !isEditable
                      ? theme.textTheme.bodyMedium?.color
                      : Colors.grey),
            ),
            iconAlignment: IconAlignment.end,
            icon: SvgIcon(
              icon: AppAssets.edit,
              color:
                  !isEditable ? theme.textTheme.bodyMedium?.color : Colors.grey,
              width: 16.r,
              height: 16.r,
            ),
          ),
        ),
      ],
    );
  }
}
