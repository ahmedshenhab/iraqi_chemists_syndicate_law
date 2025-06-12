import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_font_weight.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSubmit,
    required this.controller,

    this.labelText,
    this.readOnly = false,
    this.isHiddenPassword = false,
    this.suffixIconButton,

    required this.validator,
    this.type,
    this.onTap,
    this.hintText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.contentPadding,
    this.cursorColor,
    this.cursorHeight,
    this.cursorErrorColor,
    this.borderRadius,
    this.hintStyle,
    this.style,
    this.errorStyle,
  });

  final void Function(String)? onSubmit;
  final void Function()? onTap;
  final TextEditingController controller;

  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final TextStyle? style;

  final bool isHiddenPassword;
  final Widget? suffixIconButton;
  final String? Function(String?) validator;
  final TextInputType? type;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final double? cursorHeight;
  final Color? cursorErrorColor;
  final double? borderRadius;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:
          style ??
          TextStyle(
            fontSize: 14.sp,
            fontWeight: AppFontWeight.regular,
            color: Colors.black87,
          ),
      readOnly: readOnly,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      obscureText: isHiddenPassword,
      controller: controller,
      keyboardType: type ?? TextInputType.text,
      validator: validator,
      cursorColor: cursorColor ?? AppColor.primary, // ✅ Replace teal
      cursorHeight: cursorHeight,
      cursorErrorColor: cursorErrorColor,

      decoration: InputDecoration(
        contentPadding: contentPadding,
        floatingLabelBehavior: readOnly
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,

        labelText: labelText,
        filled: true,
        fillColor: AppColor.white,
        hintText: hintText,
        hintStyle:
            hintStyle ?? AppTextStyle.regular14.copyWith(color: AppColor.grey),

        labelStyle:
            labelStyle ?? AppTextStyle.regular14.copyWith(color: AppColor.grey),
        floatingLabelStyle: floatingLabelStyle ?? AppTextStyle.regular14,

        suffixIcon: suffixIconButton,

        errorMaxLines: 2,
        errorStyle:
            errorStyle ?? AppTextStyle.regular12.copyWith(color: AppColor.red),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: const BorderSide(color: AppColor.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: const BorderSide(color: AppColor.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(
            color: readOnly ? AppColor.grey : AppColor.primary,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: const BorderSide(color: AppColor.grey),
        ),
      ),
    );
  }
}
