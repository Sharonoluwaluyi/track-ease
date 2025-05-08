import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_fonts.dart' show AppFonts;

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? btnColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final bool isLoading;
  const CustomRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.btnColor,
    this.textColor,
    this.padding,
    this.fontWeight,
    this.fontSize,
    this.isLoading = false,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          padding ?? const EdgeInsets.symmetric(vertical: 15),
        ),
        backgroundColor: WidgetStatePropertyAll(btnColor ?? theme.primaryColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15.r),
          ),
        ),
      ),
      child: isLoading
          ? Center(child: CupertinoActivityIndicator())
          : Text(
              text,
              style: TextStyle(
                color: textColor ?? theme.textTheme.bodyMedium?.color,
                fontSize: fontSize ?? 17.sp,
                fontWeight: fontWeight ?? FontWeight.w600,
                fontFamily: fontFamily ?? AppFonts.main,
              ),
            ),
    );
  }
}

class CustomOutlinedRoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? btnColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final bool isLoading;
  const CustomOutlinedRoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.btnColor,
    this.textColor,
    this.padding,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          padding ?? const EdgeInsets.symmetric(vertical: 15),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        side: WidgetStatePropertyAll(
            BorderSide(color: btnColor ?? theme.primaryColor, width: 1.5)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15.r),
          ),
        ),
      ),
      child: isLoading
          ? Center(child: CupertinoActivityIndicator())
          : Text(
              text,
              style: TextStyle(
                color: textColor ?? theme.textTheme.bodyMedium?.color,
                fontSize: fontSize ?? 17.sp,
                fontWeight: fontWeight ?? FontWeight.w600,
                fontFamily: fontFamily ?? AppFonts.main,
              ),
            ),
    );
  }
}

// CustomRoundedIconButton with custom widget icon
class CustomRoundedIconButton extends StatelessWidget {
  final Widget icon;
  final String? text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? btnColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomRoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.text,
    this.isLoading = false,
    this.btnColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        backgroundColor: WidgetStatePropertyAll(btnColor ?? theme.primaryColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15.r),
          ),
        ),
      ),
      child: isLoading
          ? const CupertinoActivityIndicator()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                if (text != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    text!,
                    style: TextStyle(
                      color: textColor ?? theme.textTheme.bodyMedium?.color,
                      fontSize: fontSize ?? 17.sp,
                      fontWeight: fontWeight ?? FontWeight.w600,
                      fontFamily: fontFamily ?? AppFonts.main,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}

// CustomOutlinedRoundedIconButton with custom widget icon
class CustomOutlinedRoundedIconButton extends StatelessWidget {
  final Widget icon;
  final String? text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? btnColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomOutlinedRoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.text,
    this.isLoading = false,
    this.btnColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        side: WidgetStatePropertyAll(
          BorderSide(color: btnColor ?? theme.primaryColor, width: 1.5),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15.r),
          ),
        ),
      ),
      child: isLoading
          ? const CupertinoActivityIndicator()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                if (text != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    text!,
                    style: TextStyle(
                      color: textColor ?? theme.textTheme.bodyMedium?.color,
                      fontSize: fontSize ?? 17.sp,
                      fontWeight: fontWeight ?? FontWeight.w600,
                      fontFamily: fontFamily ?? AppFonts.main,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
