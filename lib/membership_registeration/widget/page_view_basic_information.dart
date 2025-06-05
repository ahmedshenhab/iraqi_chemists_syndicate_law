import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit.dart';

class PageViewBasicInformation extends StatefulWidget {
  const PageViewBasicInformation({super.key});

  @override
  State<PageViewBasicInformation> createState() =>
      _PageViewBasicInformationState();
}

class _PageViewBasicInformationState extends State<PageViewBasicInformation> {
  final TextEditingController arabicFullNameController =
      TextEditingController();
  final TextEditingController englishFullNameController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Image.asset(
                  'assets/image/png/logo.png',
                  width: 80.w,
                  height: 102.h,
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SvgPicture.asset(
                    'assets/image/svg/basic info.svg',
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  type: TextInputType.name,
                  controller: arabicFullNameController,
                  validator: (p0) {},
                  labelText: 'الاسم الثلاثي باللغه العربية',
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  type: TextInputType.name,
                  controller: englishFullNameController,
                  validator: (p0) {},
                  labelText: 'الاسم الثلاثي باللغه الانجليزية',
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  type: TextInputType.emailAddress,
                  labelText: 'الايميل',
                  controller: emailController,
                  validator: (p0) {},
                  suffixIconButton: Icon(
                    Icons.mail,
                    color: AppColor.grey,
                    size: 15.h,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  type: TextInputType.phone,
                  labelText: 'رقم الهاتف',
                  controller: phoneController,
                  validator: (p0) {},
                  suffixIconButton: Icon(
                    Icons.phone_outlined,
                    color: AppColor.grey,
                    size: 15.h,
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 155.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primary),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setState(() {
                          file = File(image.path);
                        });
                      }
                    },
                    child: file == null
                        ? CustomImage(
                            image: Image.asset(
                              'assets/image/png/empty_photo.png',
                              width: 80.w,
                              height: 80.h,
                            ),
                            text: 'تحميل صورة شخصية',
                          )
                        : CustomImage(
                            image: CircleAvatar(
                              backgroundColor: AppColor.jetStream,
                              radius: 40.r,
                              child: CircleAvatar(
                                radius: 36.r,
                                backgroundImage: FileImage(file!),
                              ),
                            ),
                            text: 'تغيير الصورة الشخصية',
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: CustomElevatedButton(
            text: 'التالي',
            onPressed: () async {
              await cubit.nextmove();
            },
            fixedHeight: 40.h,
          ),
        ),
      ],
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.image, required this.text});
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
