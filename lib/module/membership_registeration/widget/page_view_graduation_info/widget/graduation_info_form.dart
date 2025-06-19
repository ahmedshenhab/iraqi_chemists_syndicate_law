import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';

class GraduationInfoForm extends StatelessWidget {
  const GraduationInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Form(
          key: cubit.formKeyGraduation,
          autovalidateMode: AutovalidateMode.disabled,

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
                  'assets/image/svg/graduation_info.svg',
                  height: 24.h,
                ),
              ),

              SizedBox(height: 32.h),
              CustomDropDownFormField(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'الشهادة مطلوب';
                  }
                  return null;
                },
                hintText: 'الشهادة',
                items: ['بكالوريوس', 'ماجستير', 'دكتوراه']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: AppTextStyle.regular14),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  cubit.graduationType = value!;
                },
                icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
              ),
              SizedBox(height: 32.h),
              CustomDropDownFormField(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'الجامعة مطلوب';
                  }
                  return null;
                },
                hintText: 'الجامعة',
                items: ['جامعة بغداد', 'جامعة الموصل']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: AppTextStyle.regular14),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  cubit.uneversityName = value!;
                },
                icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
              ),
              SizedBox(height: 32.h),
              CustomDropDownFormField(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'الكلية مطلوب';
                  }
                  return null;
                },
                hintText: 'الكلية',
                items: ['كلية الصيدلة', 'كلية العلوم']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: AppTextStyle.regular14),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  cubit.collegName = value!;
                },
                icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
              ),

              SizedBox(height: 32.h),
              CustomDropDownFormField(
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'سنة التخرج مطلوب';
                  }
                  return null;
                },
                hintText: 'سنة التخرج',
                items: List.generate(30, (index) => (2000 + index).toString())
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: AppTextStyle.regular14),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  cubit.graduationYear = value!;
                },
                icon: const Icon(Icons.arrow_drop_down, color: AppColor.grey),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
