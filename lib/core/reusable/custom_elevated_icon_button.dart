import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    super.key,

    required this.onPressed,
    this.backgroundColor,

    this.side,
    required this.label,
    this.icon,
    this.padding,
    this.height,
    this.width,
  });

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderSide? side;
  final Widget label;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: width,
        height: height,

        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: padding,
            backgroundColor: backgroundColor ?? AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: side ?? BorderSide.none,
            ),
          ),
          label: label,
          icon: icon,
        ),
      ),
    );
  }
}
