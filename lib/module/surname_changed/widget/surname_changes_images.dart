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
          return GestureDetector(
            onTap: () {
              cubit.pickFile();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              width: double.infinity,

              decoration: BoxDecoration(
                border: Border.all(color: AppColor.seaSerpent),
                borderRadius: BorderRadius.circular(9.71.r),
              ),
              child: CustomImageAndDiscription(
                image: cubit.experienseCertificateImage != null
                    ? (cubit.experienseCertificateImage!.path
                                  .split('.')
                                  .last
                                  .toLowerCase() ==
                              "pdf"
                          ? Icon(
                              Icons.picture_as_pdf,
                              size: 48.w,
                              color: AppColor.red,
                            )
                          : Image.file(
                              cubit.experienseCertificateImage!,
                              height: 90.h,
                              width: 90.w,
                            ))
                    : SvgPicture.asset(
                        'assets/image/svg/personalcard.svg',
                        height: 90.h,
                        width: 90.w,
                      ),
                text: Text(
                  'صورة شهادة الخبرة',
                  style: AppTextStyle.medium15.copyWith(
                    color: AppColor.primary,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
                heightBetweenImageAndText: 0.h,
                extensionStyle: AppTextStyle.light9.copyWith(
                  color: AppColor.grey,
                ),

                isVisibleExtension: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
