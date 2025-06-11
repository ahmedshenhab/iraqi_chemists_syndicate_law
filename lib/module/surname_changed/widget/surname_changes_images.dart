import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';

class SurnameChangesImages extends StatelessWidget {
  const SurnameChangesImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                width: 163.w,

                height: 108.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.seaSerpent),
                  borderRadius: BorderRadius.circular(9.71.r),
                ),
                child: CustomImageAndDiscription(
                  image: SvgPicture.asset(
                    'assets/image/svg/personalcard.svg',
                    height: 43.h,
                    width: 42.w,
                  ),
                  text: Text(
                    'تحميل صورة وثيقة التخرج',

                    style: AppTextStyle.regular9.copyWith(
                      color: AppColor.primary,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  heightBetweenImageAndText: 6.h,
                  isVisibleExtension: true,
                ),
              ),

              Container(
                width: 163.w,

                height: 108.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.seaSerpent),
                  borderRadius: BorderRadius.circular(9.71.r),
                ),
                child: CustomImageAndDiscription(
                  image: SvgPicture.asset(
                    'assets/image/svg/personalcard.svg',
                    height: 43.h,
                    width: 42.w,
                  ),
                  text: Text(
                    'تحميل صورة وثيقة التخرج',

                    style: AppTextStyle.regular9.copyWith(
                      color: AppColor.primary,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  heightBetweenImageAndText: 6.h,
                  isVisibleExtension: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 163.w,

                height: 108.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.seaSerpent),
                  borderRadius: BorderRadius.circular(9.71.r),
                ),
                child: CustomImageAndDiscription(
                  image: SvgPicture.asset(
                    'assets/image/svg/personalcard.svg',
                    height: 43.h,
                    width: 42.w,
                  ),
                  text: Text(
                    'تحميل صورة وثيقة التخرج',

                    style: AppTextStyle.regular9.copyWith(
                      color: AppColor.primary,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  heightBetweenImageAndText: 6.h,
                  isVisibleExtension: true,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ملاحظات /',
                      style: AppTextStyle.regular7.copyWith(
                        color: AppColor.grey,
                      ),
                    ),

                    Wrap(
                      spacing: 2.w,
                      runSpacing: 2.h,
                      children: [
                        Text(
                          'عند رفع شهادة الماجستير ',
                          style: AppTextStyle.regular7.copyWith(
                            color: AppColor.grey,
                          ),
                        ),
                        Text(
                          'تضاف (2) سنة',
                          style: AppTextStyle.regular7.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                        Text(
                          'لسنوات الخبرة',
                          style: AppTextStyle.regular7.copyWith(
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 2.w,
                      runSpacing: 2.h,
                      children: [
                        Text(
                          'عند رفع شهادة الدكتوراة ',
                          style: AppTextStyle.regular7.copyWith(
                            color: AppColor.grey,
                          ),
                        ),
                        Text(
                          'تضاف (3) سنة',
                          style: AppTextStyle.regular7.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                        Text(
                          'لسنوات الخبرة',
                          style: AppTextStyle.regular7.copyWith(
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
      ),
    );
  }
}
