
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/reusable.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/cubit/surname_changed_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/widget/surname_changes_forms.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/widget/surname_changes_images.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/widget/surname_listner.dart';

class SurnameChanged extends StatelessWidget {
  const SurnameChanged({super.key});
  static const routeName = '/surnameChanged';

  @override
  Widget build(BuildContext context) {
    final cubit = SurnameChangedCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Column(
                  children: [
                    const SurnameChangesForms(),

                    SizedBox(height: 16.h),
                    const SurnameChangesImages(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 10.h,
                top: 12.h,
                start: 16.w,
                end: 16.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomElevatedIconButton(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 10.w,
                      ),
                      side: const BorderSide(color: AppColor.primary),
                      backgroundColor: AppColor.white,
                      onPressed: () {},

                      icon: SvgPicture.asset(
                        'assets/image/svg/skip_previous.svg',
                        width: 18.w,
                      ),
                      label: Text(
                        'الرجوع',
                        style: AppTextStyle.bold14.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 45.w),

                  BlocBuilder<SurnameChangedCubit, SurnameChangedState>(
                    buildWhen: (previous, current) =>
                        current is SurnameChangedLoading ||
                        current is SurnameChangedSuccess ||
                        current is SurnameChangedError,
                    builder: (context, state) {
                      return state is SurnameChangedLoading
                          ? const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primary,
                                ),
                              ),
                            )
                          : Expanded(
                              child: CustomElevatedIconButton(
                                padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 10.w,
                                ),
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate() &&
                                      cubit.experienseCertificateImage !=
                                          null) {
                                    cubit.changeSurname();
                                  } else {
                                    buildshowToast(
                                      msg: 'من فضلك ادخل جميع البيانات',
                                      color: AppColor.red,
                                    );
                                  }
                                },

                                icon: SvgPicture.asset(
                                  'assets/image/svg/money.svg',
                                  width: 18.w,
                                ),
                                label: Text(
                                  'دفع رسوم التجديد',
                                  style: AppTextStyle.bold14.copyWith(
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
            const SurnameListner()
          ],
        ),
      ),
    );
  }
}
