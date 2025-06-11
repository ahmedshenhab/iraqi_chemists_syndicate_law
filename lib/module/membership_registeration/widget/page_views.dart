import 'package:flutter/material.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/cubit/membership_registeration_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/done.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_attachments/page_view_attatchments.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_basic_information/page_view_basic_information.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_graduation_info.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_view_homming_information.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/pledge_and_registration.dart';

class PageViews extends StatelessWidget {
  const PageViews({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return PageView(
      controller: cubit.pageController,

      // physics: const NeverScrollableScrollPhysics(),
      children: const [
        PageViewBasicInformation(),
        PageViewAttatchments(),
        PageViewHommingInformation(),
        PageViewGraduationInfo(),
        PledgeAndRegistration(),
        Done(),
      ],
    );
  }
}
