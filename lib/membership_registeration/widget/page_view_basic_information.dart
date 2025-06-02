import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_text_form_field.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit_cubit.dart';

class PageViewBasicInformation extends StatefulWidget {
  const PageViewBasicInformation({super.key});

  @override
  State<PageViewBasicInformation> createState() =>
      _PageViewBasicInformationState();
}

class _PageViewBasicInformationState extends State<PageViewBasicInformation> {
  final TextEditingController arabicFullNameController =
      TextEditingController();
  final TextEditingController englishFullNameController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/image/svg/basic info.svg',
              width: MediaQuery.of(context).size.width * 0.65,
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              type: TextInputType.name,

              controller: arabicFullNameController,
              validator: (p0) {},
              labelText: 'الاسم الثلاثي باللغه العربية',
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              type: TextInputType.name,
              controller: englishFullNameController,
              validator: (p0) {},
              labelText: 'الاسم الثلاثي باللغه الانجليزية',
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              type: TextInputType.emailAddress,

              labelText: 'البريد الالكتروني',
              controller: emailController,
              validator: (p0) {},
              suffixIconButton: Icon(
                Icons.mail,
                color: AppColor.grey,
                size: 15.h,
              ),
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              type: TextInputType.phone,

              labelText: 'رقم الهاتف',
              controller: phoneController,
              validator: (p0) {},
              suffixIconButton: Icon(
                Icons.mail,
                color: AppColor.grey,
                size: 15.h,
              ),
            ),
            SizedBox(height: 15.h),

            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 155.h,
              decoration: BoxDecoration(
                border: BoxBorder.all(color: AppColor.primary),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Image.asset(
                'assets/image/png/empty_photo.png',
                width: 80.w,
                height: 80.h,
              ),
            ),
            SizedBox(height: 15.h),

            CustomElevatedButton(
              text: 'التالي',
              onPressed: () async {
                await cubit.nextmove();
              },

              fixedHeight: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
