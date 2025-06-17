import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/custom_image_and_discription.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/cubit/renew_member_cubit.dart';

class RenewMemberImages extends StatelessWidget {
  const RenewMemberImages({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RenewMemberCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<RenewMemberCubit, RenewMemberState>(
        buildWhen: (previous, current) => current is RenewMemberChangeimage,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              cubit.pickFile();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.seaSerpent),
                borderRadius: BorderRadius.circular(9.71.r),
              ),
              child: CustomImageAndDiscription(
                image: cubit.identityCardImage != null
                    ? (cubit.identityCardImage!.path
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
                              cubit.identityCardImage!,
                              height: 90.h,
                              width: 90.w,
                            ))
                    : SvgPicture.asset(
                        'assets/image/svg/personalcard.svg',
                        height: 90.h,
                        width: 90.w,
                      ),
                text: Text(
                  'تحميل صورة كارنية النقابة',

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
