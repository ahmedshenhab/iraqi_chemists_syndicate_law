import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';

class PersonalImageBasicInformation extends StatefulWidget {
  const PersonalImageBasicInformation({super.key});

  @override
  State<PersonalImageBasicInformation> createState() =>
      _PersonalImageBasicInformationState();
}

class _PersonalImageBasicInformationState
    extends State<PersonalImageBasicInformation> {
  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 155.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primary),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: GestureDetector(
        onTap: pickImage,
        child: cubit.personalImage == null
            ? CustomImageAndDiscription(
                heightBetweenImageAndText: 0.h,
                image: Image.asset(
                  'assets/image/png/empty_photo.png',
                  width: 80.w,
                  height: 80.h,
                ),
                text: Text(
                  'تحميل صورة شخصية',
                  style: AppTextStyle.regular16.copyWith(
                    color: AppColor.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            : CustomImageAndDiscription(
                heightBetweenImageAndText: 0.h,
                image: CircleAvatar(
                  backgroundColor: AppColor.jetStream,
                  radius: 40.r,
                  child: CircleAvatar(
                    radius: 36.r,
                    backgroundImage: FileImage(cubit.personalImage!),
                  ),
                ),
                text: Text(
                  'تغيير الصورة الشخصية',
                  style: AppTextStyle.regular16.copyWith(
                    color: AppColor.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
      ),
    );
  }

  void pickImage() async {
    final cubit = MembershipRegisterationCubit.get(context);
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      cubit.personalImage = image != null && image.path.isNotEmpty? File(image.path) : null;
    });
  }
}
