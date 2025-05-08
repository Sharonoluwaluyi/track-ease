import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart' show AppColors;
import '../constants/app_fonts.dart' show AppFonts;

class CustomTextfield extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? label;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final TextStyle? titleStyle;
  final int? maxLength;
  final void Function()? onTap;
  final String? prefixText;
  final String? info;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool filled;
  final Color? fillColor;
  final InputBorder? border;
  final double? fontSize;
  final FontWeight? fontWeight;
  final void Function(String)? onChanged;
  const CustomTextfield({
    super.key,
    this.title,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.readOnly,
    this.textInputAction,
    this.textInputType,
    this.hintText,
    this.label,
    this.hintTextStyle,
    this.obscureText = false,
    this.textStyle,
    this.titleStyle,
    this.maxLength,
    this.onTap,
    this.prefixText,
    this.info,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.filled = false,
    this.fillColor,
    this.border,
    this.fontSize,
    this.fontWeight,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.r,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (title != null)
          Row(
            spacing: 5.r,
            children: [
              Text(
                title!,
                style: titleStyle ??
                    TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.main,
                    ),
              ),
              // if (info != null)
              //   InfoTooltip(
              //     tooltipMessage: info!,
              //   )
            ],
          ),
        TextField(
          controller: controller,
          minLines: maxLines,
          maxLines: maxLines,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          readOnly: readOnly ?? false,
          style: TextStyle(
            fontSize: fontSize ?? 14.sp,
            fontFamily: AppFonts.main,
            fontWeight: fontWeight,
          ),
          onTap: onTap,
          maxLength: maxLength,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            label: label,
            prefixIcon: prefixIcon,
            border: border ??
                OutlineInputBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.grey.withValues(alpha: .8),
                  ),
                ),
            fillColor: fillColor,
            filled: filled,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 19),
            hintStyle: TextStyle(
              fontSize: fontSize ?? 14.sp,
              fontFamily: AppFonts.main,
              color: AppColors.grey,
              fontWeight: fontWeight,
            ),
            prefixText: prefixText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
