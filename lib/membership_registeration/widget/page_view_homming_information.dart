import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit.dart';

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
