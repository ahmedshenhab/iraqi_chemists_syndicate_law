import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/widget/page_views.dart';

class MembershipRegisterationScreen extends StatelessWidget {
  const MembershipRegisterationScreen({super.key});

  static const String routeName = '/membership_registeration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Column(
            children: [
             

              Expanded(child: PageViews()),
            ],
          ),
        ),
      ),
    );
  }
}
