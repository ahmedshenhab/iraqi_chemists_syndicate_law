import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';

class CustomDropDownFormField<T> extends StatelessWidget {
  const CustomDropDownFormField({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.contentPadding,
    this.borderColor,
    this.borderRadius = 8.0,
    required this.icon,
    this.hintStyle,
    this.style,
    this.validator,
    this.errorStyle,
  });
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final double borderRadius;
  final Widget icon;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? Function(T?)? validator;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      isExpanded: true,

      elevation: 1,

      style: style ?? AppTextStyle.regular14.copyWith(color: AppColor.black),
      icon: icon,
      menuMaxHeight: 200.h,
      errorBuilder: (context, errorText) {
        return Text(
          errorText,
          style:
              errorStyle ??
              AppTextStyle.regular12.copyWith(color: AppColor.red),
        );
      },

      padding: contentPadding,
      decoration: InputDecoration(
      
        fillColor: AppColor.white,
        hint: Text(
          hintText ?? 'Select an option',
          style: AppTextStyle.regular14.copyWith(color: AppColor.grey),
        ),
        hintStyle:
            hintStyle ?? AppTextStyle.regular14.copyWith(color: AppColor.grey),

        contentPadding: contentPadding,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? AppColor.grey),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? AppColor.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColor.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColor.red),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? AppColor.primary),
        ),
      ),
    );
  }
}
