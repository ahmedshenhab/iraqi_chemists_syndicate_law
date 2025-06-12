import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/cubit/surname_changed_cubit.dart';

class SurnameChangesImages extends StatelessWidget {
  const SurnameChangesImages({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SurnameChangedCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<SurnameChangedCubit, SurnameChangedState>(
        buildWhen: (previous, current) => current is SurnameChangeimage,
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  GestureDetector(
                    onTap: () {
                      cubit.pickFile(0);
                    },
                    child: Container(
                      width: 164.w,

                      height: 110.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.seaSerpent),
                        borderRadius: BorderRadius.circular(9.71.r),
                      ),
                      child: CustomImageAndDiscription(
                        image: cubit.magesteerimage != null
                            ? Image.file(
                                cubit.magesteerimage!,
                                height: 43.h,
                                width: 42.w,
                              )
                            : SvgPicture.asset(
                                'assets/image/svg/personalcard.svg',
                                height: 43.h,
                                width: 42.w,
                              ),
                        text: Text(
                          'تحميل صورة شهادة الماجستير',

                          style: AppTextStyle.regular10.copyWith(
                            color: AppColor.primary,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        heightBetweenImageAndText: 0.h,
                        isVisibleOptional: true,
                        isVisibleExtension: true,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      cubit.pickFile(1);
                    },
                    child: Container(
                      width: 164.w,

                      height: 110.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.seaSerpent),
                        borderRadius: BorderRadius.circular(9.71.r),
                      ),
                      child: CustomImageAndDiscription(
                        image: cubit.graduationimage != null
                            ? Image.file(
                                cubit.graduationimage!,
                                height: 43.h,
                                width: 42.w,
                              )
                            : SvgPicture.asset(
                                'assets/image/svg/personalcard.svg',
                                height: 43.h,
                                width: 42.w,
                              ),
                        text: Text(
                          'تحميل صورة وثيقة التخرج',

                          style: AppTextStyle.regular10.copyWith(
                            color: AppColor.primary,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        heightBetweenImageAndText: 0.h,
                        isVisibleOptional: true,

                        isVisibleExtension: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      cubit.pickFile(2);
                    },
                    child: Container(
                      width: 164.w,

                      height: 110.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.seaSerpent),
                        borderRadius: BorderRadius.circular(9.71.r),
                      ),
                      child: CustomImageAndDiscription(
                        heightBetweenImageAndText: 0.h,
                        isVisibleOptional: true,
                        image: cubit.doctorsimage != null
                            ? Image.file(
                                cubit.doctorsimage!,
                                height: 43.h,
                                width: 42.w,
                              )
                            : SvgPicture.asset(
                                'assets/image/svg/personalcard.svg',
                                height: 43.h,
                                width: 42.w,
                              ),
                        text: Text(
                          'تحميل صورة شهادة الدكتوراة',

                          style: AppTextStyle.regular10.copyWith(
                            color: AppColor.primary,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        isVisibleExtension: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 164.w,
                    height: 110.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ملاحظات /',
                          style: AppTextStyle.regular10.copyWith(
                            color: AppColor.grey,
                          ),
                        ),

                        Wrap(
                          spacing: 2.w,
                          runSpacing: 2.h,
                          children: [
                            Text(
                              'عند رفع شهادة الماجستير ',
                              style: AppTextStyle.regular10.copyWith(
                                color: AppColor.grey,
                              ),
                            ),
                            Text(
                              'تضاف (2) سنة',
                              style: AppTextStyle.regular10.copyWith(
                                color: AppColor.primary,
                              ),
                            ),
                            Text(
                              'لسنوات الخبرة',
                              style: AppTextStyle.regular10.copyWith(
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.h),
                        Wrap(
                          spacing: 2.w,
                          runSpacing: 2.h,
                          children: [
                            Text(
                              'عند رفع شهادة الدكتوراة ',
                              style: AppTextStyle.regular10.copyWith(
                                color: AppColor.grey,
                              ),
                            ),
                            Text(
                              'تضاف (3) سنة',
                              style: AppTextStyle.regular10.copyWith(
                                color: AppColor.primary,
                              ),
                            ),
                            Text(
                              'لسنوات الخبرة',
                              style: AppTextStyle.regular10.copyWith(
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
