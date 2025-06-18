import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/custom_elevated_icon_button.dart';
import 'package:iraqi_chemists_syndicate_law/core/reusable/reusable.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_state.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_basic_pledge/widget/page_view_pledge_and_register_form.dart';

class PledgeAndRegistration extends StatefulWidget {
  const PledgeAndRegistration({super.key});

  @override
  State<PledgeAndRegistration> createState() => _PledgeAndRegistrationState();
}

class _PledgeAndRegistrationState extends State<PledgeAndRegistration> {
  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return Column(
      children: [
        SizedBox(height: 12.h),
        Image.asset('assets/image/png/logo.png', width: 80.w, height: 102.h),
        SizedBox(height: 24.h),
        const PageViewPledgeAndRegisterForm(),

        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 10.h, top: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomElevatedIconButton(
                  onPressed: ()  {
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

              BlocBuilder<
                MembershipRegisterationCubit,
                MembershipRegisterationState
              >(
                buildWhen: (previous, current) =>
                    current is MembershipRegisterationLoading ||
                    current is MembershipRegisterationSuccess ||
                    current is MembershipRegisterationError,
                builder: (context, state) {
                  return state is MembershipRegisterationLoading
                      ? const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.primary,
                            ),
                          ),
                        )
                      : Expanded(
                          child: CustomElevatedIconButton(
                            onPressed: () async {
                              // Show validation messages if not valid
                              if (cubit.isEmployee == null ||
                                  cubit.isAgreeToTerms == false ||
                                  cubit.isPledgedInfoAccuracy == false) {
                                buildshowToast(
                                  msg: 'من فضلك وافق على جميع الشروط',
                                  color: AppColor.red,
                                );
                                return;
                              }

                              await cubit.createMember();
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
                        );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
