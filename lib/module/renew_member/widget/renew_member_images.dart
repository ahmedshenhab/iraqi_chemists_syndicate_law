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
              width: 306.w,

              height: 267.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.seaSerpent),
                borderRadius: BorderRadius.circular(9.71.r),
              ),
              child: CustomImageAndDiscription(
                image: cubit.magesteerimage != null
                    ? Image.file(
                        cubit.magesteerimage!,
                        height: 90.h,
                        width: 90.w,
                      )
                    : SvgPicture.asset(
                        'assets/image/svg/personalcard.svg',
                        height: 90.h,
                        width: 90.w,
                      ),
                text: Text(
                  'تحميل صورة شهادة الماجستير',

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
