import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';

class PageViewIdentityInformation extends StatefulWidget {
  const PageViewIdentityInformation({super.key});

  @override
  State<PageViewIdentityInformation> createState() =>
      _PageViewIdentityInformationState();
}

class _PageViewIdentityInformationState
    extends State<PageViewIdentityInformation> {
  final TextEditingController registrationNumber = TextEditingController();
  final TextEditingController registrationDate = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                      'assets/image/svg/identity information.svg',
                      height: 24.h,
                    ),
                  ),
                  SizedBox(height: 198.h),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 202.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primary),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,

                              allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
                            );

                            if (result != null && result.files.isNotEmpty) {
                              setState(() {
                                file = File(result.files.first.path!);
                              });
                            }
                          },
                          child: file == null
                              ? CustomImageAndDiscription(
                                  image: Image.asset(
                                    'assets/image/png/personalcard.png',
                                    width: 80.w,
                                    height: 80.h,
                                  ),
                                  text: 'تحميل صورة الهوية الوطنية',
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    file!.path.endsWith('.pdf')
                                        ? Icon(
                                            Icons.picture_as_pdf,
                                            size: 40.w,
                                            color: Colors.red,
                                          )
                                        : Image.file(
                                            file!,
                                            width: 80.w,
                                            height: 80.h,
                                            fit: BoxFit.cover,
                                          ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      file!.path.split('/').last,
                                      style: AppTextStyle.bold14.copyWith(
                                        color: AppColor.primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                        ),
                        SizedBox(height: 13.h),
                        Text(
                          '.PDF, .PNG & .JPEG الصيغ المسموح بها',
                          style: AppTextStyle.light8.copyWith(
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
