import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit_cubit.dart';

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/image/svg/homming information.svg',
            width: MediaQuery.of(context).size.width * 0.65,
          ),
          SizedBox(height: 15.h),
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
            icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
          ),
          SizedBox(height: 15.h),
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
            icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
          ),
          SizedBox(height: 15.h),

          CustomTextFormField(
            labelText: 'زقاق',
            controller: zokakController,
            validator: (p0) {},
          ),
          SizedBox(height: 15.h),

          CustomTextFormField(
            labelText: 'دار',
            controller: homeController,
            validator: (p0) {},
          ),
          SizedBox(height: 15.h),

          CustomElevatedButton(
            text: 'التالي',
            onPressed: () {
              cubit.nextmove();
            },
            fixedHeight: 40.h,
          ),
        ],
      ),
    );
  }
}
