import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/widget/page_views.dart';

class MembershipRegisterationScreen extends StatelessWidget {
  const MembershipRegisterationScreen({super.key});

  static const String routeName = '/membership_registeration';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/image/png/logo.png',
              width: 80.w,
              height: 102.h,
            ),

            const PageViews(),
          ],
        ),
      ),
    );
  }
}
