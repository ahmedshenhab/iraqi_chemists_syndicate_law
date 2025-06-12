import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';

class HommingInformationForm extends StatelessWidget {
  const HommingInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Form(
          key: cubit.formKeyHomming,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'المحافظه مطلوب';
                  }
                  return null;
                },

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
                icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
              ),

              SizedBox(height: 32.h),
              CustomDropDownFormField(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'المدينه مطلوب';
                  }
                  return null;
                },
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
              SizedBox(height: 32.h),
              CustomDropDownFormField(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'محله مطلوب';
                  }
                  return null;
                },
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
              SizedBox(height: 32.h),

              CustomTextFormField(
                labelText: 'زقاق',
                controller: cubit.zokakController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'زقاق مطلوب';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.h),

              CustomTextFormField(
                labelText: 'دار',
                controller: cubit.homeController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'دار مطلوب';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
