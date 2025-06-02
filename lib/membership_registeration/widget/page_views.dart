import 'package:flutter/material.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/cubit/membership_registeration_cubit_cubit.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/widget/page_view_Identity_information.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/widget/page_view_basic_information.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/widget/page_view_graduation_info.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/widget/page_view_homming_information.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/widget/pledge_and_registration.dart';

class PageViews extends StatelessWidget {
  const PageViews({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MembershipRegisterationCubit.get(context);

    return Expanded(
      child: PageView(
        controller: cubit.pageController,

        // physics: const NeverScrollableScrollPhysics(),
        children: const [
          // basic information
          PageViewBasicInformation(),
          PageViewIdentityInformation(),
          PageViewHommingInformation(),
          PageViewGraduationInfo(),
          PledgeAndRegistration(),
        ],
      ),
    );
  }
}
