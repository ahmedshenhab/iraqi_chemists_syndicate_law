import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';

class AttachmentItemCard extends StatelessWidget {
  const AttachmentItemCard({
    super.key,
    required this.attachment,
    required this.file,
  });

  final Map<String, dynamic> attachment;
  final File? file;

  @override
  Widget build(BuildContext context) {
    // Extract properties from attachment object

    final bool isVisibleOptional = attachment['isVisibleOptional'];

    Widget displayImage;
    String displayText;

    if (file != null) {
      final String extension = file!.path.split('.').last.toLowerCase();
      final isPdf = extension == 'pdf';

      displayImage = isPdf
          ? Icon(Icons.picture_as_pdf, size: 48.w, color: AppColor.red)
          : Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.71.r),
              ),

              child: Image.file(
                file!,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.cover,
              ),
            );

      displayText = file!.path.split('/').last;
    } else {
      displayImage = Image.asset(
        'assets/image/png/personalcard.png',
        width: 48.w,
        height: 48.h,
      );
      displayText = attachment['title'];
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.seaSerpent),
        borderRadius: BorderRadius.circular(9.71.r),
      ),
      child: CustomImageAndDiscription(
        image: displayImage,
        text: Text(
          displayText,
          style: AppTextStyle.regular10.copyWith(
            color: AppColor.primary,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
        heightBetweenImageAndText: 6.h,
        isVisibleExtension: true,
        isVisibleOptional: isVisibleOptional,
      ),
    );
  }
}
