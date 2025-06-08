import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';

class PageViewHommingInformation extends StatefulWidget {
  const PageViewHommingInformation({super.key});

  @override
  State<PageViewHommingInformation> createState() =>
      _PageViewHommingInformationState();
}

class _PageViewHommingInformationState
    extends State<PageViewHommingInformation> {
  final zokakController = TextEditingController();
  final homeController = TextEditingController();
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
                      'assets/image/svg/homming information.svg',
                      height: 24.h,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomDropDownFormField(
                    hintText: 'المحافظه',
                    items: ['sss', 'sssss']
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: AppTextStyle.regular14),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomDropDownFormField(
                    hintText: 'المدينه',
                    items: ['sss', 'sssss']
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: AppTextStyle.regular14),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomDropDownFormField(
                    hintText: 'محله',
                    items: ['sss', 'sssss']
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: AppTextStyle.regular14),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {},
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  CustomTextFormField(
                    labelText: 'زقاق',
                    controller: zokakController,
                    validator: (p0) {},
                  ),
                  SizedBox(height: 32.h),

                  CustomTextFormField(
                    labelText: 'دار',
                    controller: homeController,
                    validator: (p0) {},
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 204.h,
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
                                  image: SvgPicture.asset(
                                    'assets/image/svg/icon_download_image.svg',
                                    width: 90.w,
                                    height: 90.h,
                                  ),
                                  text: 'تحميل صورة بطاقة السكن',
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    file!.path.endsWith('.pdf')
                                        ? Icon(
                                            Icons.picture_as_pdf,
                                            size: 40.w,
                                            color: AppColor.red,
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
            onPressed: () {
              cubit.nextmove();
            },
            fixedHeight: 40.h,
          ),
        ),
      ],
    );
  }
}
