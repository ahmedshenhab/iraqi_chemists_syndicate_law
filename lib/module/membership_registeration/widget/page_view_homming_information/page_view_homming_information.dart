import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_homming_information/widget/homming_information_form.dart';

class PageViewHommingInformation extends StatelessWidget {
  const PageViewHommingInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return Column(
      children: [
        const HommingInformationForm(),

        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomElevatedIconButton(
                  onPressed: () {
                    cubit.previousPage();
                  },
                  backgroundColor: AppColor.white,
                  side: const BorderSide(color: AppColor.primary),
                  icon: SvgPicture.asset(
                    'assets/image/svg/skip_previous.svg',
                    width: 22.w,
                  ),
                  label: Text(
                    'السابق',
                    style: AppTextStyle.bold14.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 30.w),

              Expanded(
                child: CustomElevatedIconButton(
                  onPressed: () async {
                    // Show validation messages if not valid
                    if (cubit.formKeyHomming.currentState!.validate()) {
                      await cubit.nextPage();
                    }
                  },
                  icon: SvgPicture.asset(
                    'assets/image/svg/skip_next.svg',
                    width: 22.w,
                  ),
                  label: Text(
                    'التالي',
                    style: AppTextStyle.bold14.copyWith(color: AppColor.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
