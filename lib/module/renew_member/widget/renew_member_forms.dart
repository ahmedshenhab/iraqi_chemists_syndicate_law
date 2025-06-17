import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/cubit/renew_member_cubit.dart';

class RenewMemberForms extends StatelessWidget {
  const RenewMemberForms({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RenewMemberCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Image.asset(
              'assets/image/png/logo.png',
              width: 80.w,
              height: 102.h,
            ),
            SizedBox(height: 15.h),
            Text('تجديد الانتساب', style: AppTextStyle.bold27),
            SizedBox(height: 6.h),

            Text(
              'جدد انتسابك بخطوة واحدة',
              style: AppTextStyle.medium15.copyWith(color: AppColor.grey),
            ),
            SizedBox(height: 27.h),
            CustomTextFormField(
              type: TextInputType.number,
              labelText: 'رقم التسجيل',

              controller: cubit.registrationNumberController,
              cursorHeight: 13.h,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'رقم التسجيل مطلوب';
                }
                return null;
              },
            ),
            SizedBox(height: 19.h),
            CustomTextFormField(
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());

                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  cubit.registrationDateController.text = DateFormat(
                    'yyyy-MM-dd',
                  ).format(pickedDate);
                }
              },

              hintText: 'تاريخ التسجيل',
              readOnly: true,

              suffixIconButton: Icon(
                Icons.calendar_month,
                color: AppColor.grey,
                size: 16.h,
              ),

              controller: cubit.registrationDateController,
              cursorHeight: 13.h,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'تاريخ التسجيل مطلوب';
                }
                return null;
              },
            ),

            SizedBox(height: 19.h),
          ],
        ),
      ),
    );
  }
}
