import 'package:flutter/material.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';

class CustomImageAndDiscription extends StatelessWidget {
  const CustomImageAndDiscription({
    super.key,
    required this.image,
    required this.text,
  });
  final Widget image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        Text(
          text,
          style: AppTextStyle.regular16.copyWith(
            color: AppColor.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
