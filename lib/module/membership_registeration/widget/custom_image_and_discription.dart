import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';

class CustomImageAndDiscription extends StatelessWidget {
  const CustomImageAndDiscription({
    super.key,
    required this.image,
    required this.text,
    required this.heightBetweenImageAndText,
    this.isVisibleExtension = false,
    this.isVisibleOptional = false, this.extensionStyle,
  });
  final Widget image;
  final Widget text;
  final double heightBetweenImageAndText;
  final bool isVisibleExtension;
  final bool isVisibleOptional;
  final TextStyle? extensionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        Visibility(
          visible: isVisibleOptional,
          child: Column(
            children: [
              SizedBox(height: 6.h),
              Text(
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                '(اختياري)',
                style: AppTextStyle.light7.copyWith(color: AppColor.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: heightBetweenImageAndText),
        text,
        Visibility(
          visible: isVisibleExtension,
          child: Column(
            children: [
              SizedBox(height: 7.h),
              Text(
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                'الصيغ المسموح بها PDF, PNG & .JPEG',
                style: extensionStyle?? AppTextStyle.light7.copyWith(color: AppColor.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
