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
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_attachments/widget/attachment_item_card.dart';

class PageViewAttatchments extends StatelessWidget {
  const PageViewAttatchments({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);
    return Column(
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
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SvgPicture.asset(
                    'assets/image/svg/attachment.svg',
                    height: 24.h,
                  ),
                ),
                SizedBox(height: 16.h),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 15.h,
                    mainAxisExtent: 130.h,
                  ),
                  itemCount: cubit.attachments.length,
                  itemBuilder: (context, index) {
                    final attachment = cubit.attachments[index];

                    return BlocBuilder<
                      MembershipRegisterationCubit,
                      MembershipRegisterationState
                    >(
                      buildWhen: (previous, current) {
                        return current is AttachmentFileUpdated &&
                            current.attachmentKey == attachment['key'];
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () => cubit.pickFile(attachment['key']),
                          child: AttachmentItemCard(
                            attachment: attachment,
                            file: cubit.attachmentFiles[attachment['key']],
                          ),
                        );
                      },
                    );
                  },
                ),
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

              Expanded(
                child: CustomElevatedIconButton(
                  onPressed: () async {
                    // Show validation messages if not valid
                    if (!cubit.isRequredAttachmentsHere) {
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
                    style: AppTextStyle.bold14.copyWith(color: AppColor.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
