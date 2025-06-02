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
  });

  final void Function(String)? onSubmit;
  final void Function()? onTap;
  final TextEditingController controller;

  final String? labelText;
  final String? hintText;
  final bool readOnly;

  final bool isHiddenPassword;
  final Widget? suffixIconButton;
  final String? Function(String?) validator;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      style: TextStyle(
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
      cursorColor: AppColor.black, // ✅ Replace teal

      decoration: InputDecoration(
        floatingLabelBehavior: readOnly
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.auto,

        labelText: labelText,
        filled: true,
        fillColor: AppColor.white,
        hintText: hintText,

        labelStyle: AppTextStyle.regular14.copyWith(color: AppColor.grey),
        floatingLabelStyle: AppTextStyle.regular14,

        suffixIcon: suffixIconButton,

        errorMaxLines: 2,
        errorStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: readOnly ? AppColor.grey : AppColor.primary,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColor.grey),
        ),
      ),
    );
  }
}
