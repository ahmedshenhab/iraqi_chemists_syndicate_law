import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/reusable.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_basic_information/widget/form_basic_information.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_basic_information/widget/personal_image_basic_information.dart';

class PageViewBasicInformation extends StatefulWidget {
  const PageViewBasicInformation({super.key});

  @override
  State<PageViewBasicInformation> createState() =>
      _PageViewBasicInformationState();
}

class _PageViewBasicInformationState extends State<PageViewBasicInformation> {
  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: MembershipRegisterationCubit.get(context).formKeyBasicInformation,
      child: Column(
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
                  // Make sure fields inside this respond to validation
                  const FormBasicInformation(),

                  SizedBox(height: 32.h),
                  const PersonalImageBasicInformation(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomElevatedIconButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      if (!(cubit.formKeyBasicInformation.currentState!
                              .validate()) ||
                          (cubit.personalImage == null)) {
                        buildshowToast(
                          msg: 'من فضلك ادخل جميع البيانات',
                          color: AppColor.red,
                        );
                        return;
                      }

                      await cubit.nextPage();
                    },
                    icon: SvgPicture.asset(
                      'assets/image/svg/skip_next.svg',
                      width: 22.w,
                    ),
                    label: Text(
                      'التالي',
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
