import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_drop_down_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/cubit/surname_changed_cubit.dart';

class SurnameChangesForms extends StatelessWidget {
  const SurnameChangesForms({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SurnameChangedCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.w),
      child: Column(
        children: [
          SizedBox(height: 48.h),
          Image.asset('assets/image/png/logo.png', width: 80.w, height: 102.h),
          SizedBox(height: 15.h),
          Text('تغيير اللقب', style: AppTextStyle.bold27),
          SizedBox(height: 6.h),

          Text(
            'غير لقبك بخطوة واحدة',
            style: AppTextStyle.medium15.copyWith(color: AppColor.grey),
          ),
          SizedBox(height: 27.h),
          SizedBox(
            height: 20.h,

            child: CustomTextFormField(
              // style: AppTextStyle.regular7,
              borderRadius: 3.r,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
              floatingLabelStyle: AppTextStyle.regular7,
              labelStyle: AppTextStyle.regular7.copyWith(color: AppColor.grey),
              type: TextInputType.number,
              labelText: 'رقم التسجيل',

              controller: cubit.surnameController,
              cursorHeight: 13.h,
              validator: (p0) {},
            ),
          ),
          SizedBox(height: 19.h),
          SizedBox(
            height: 26.h,

            child: CustomTextFormField(
              // style: AppTextStyle.regular7,
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
              hintStyle: AppTextStyle.regular7.copyWith(color: AppColor.grey),

              borderRadius: 3.r,

              type: TextInputType.number,
              hintText: 'تاريخ التسجيل',
              readOnly: true,

              suffixIconButton: Padding(
                padding: EdgeInsetsDirectional.only(start: 15.w),
                child: Icon(
                  Icons.calendar_month,
                  color: AppColor.grey,
                  size: 8.h,
                ),
              ),

              controller: cubit.registrationDateController,
              cursorHeight: 13.h,
              validator: (p0) {},
            ),
          ),

          SizedBox(height: 19.h),

          SizedBox(
            height: 26.h,
            child: CustomDropDownFormField(
              hintStyle: AppTextStyle.regular7.copyWith(color: AppColor.grey),
              // style: AppTextStyle.regular7.copyWith(color: AppColor.black),
              hintText: 'المرتبة',

              borderRadius: 3.r,
              items: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,

                        style: AppTextStyle.regular14.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
              contentPadding: EdgeInsetsDirectional.only(start: 12.w, end: 5),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColor.grey,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
