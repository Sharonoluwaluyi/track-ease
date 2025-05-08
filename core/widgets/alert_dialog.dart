import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

void alertDialog({required String message, bool isError = true}) {
  toastification.show(
    description: Text(
      message,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    type: !isError ? ToastificationType.success : ToastificationType.error,
    autoCloseDuration: const Duration(seconds: 5),
  );
}
