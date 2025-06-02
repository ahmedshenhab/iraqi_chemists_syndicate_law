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
  });
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final double borderRadius;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,

      icon: icon,

      isExpanded: true,

      decoration: InputDecoration(


        fillColor: AppColor.white,
        hint: Text(
          hintText ?? 'Select an option',
          style: AppTextStyle.regular14.copyWith(color: AppColor.grey),
        ),

        contentPadding: contentPadding,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? AppColor.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor ?? AppColor.primary),
        ),
      ),
    );
  }
}
