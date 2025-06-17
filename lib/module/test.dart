import 'package:flutter/material.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/membership_registeration_screen.dart';
import 'package:iraqi_chemists_syndicate_law/module/renew_member/renew_member.dart';
import 'package:iraqi_chemists_syndicate_law/module/surname_changed/surname_changed.dart';

class Test extends StatelessWidget {
  const Test({super.key});
  static const String routeName = '/Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MembershipRegisterationScreen.routeName,
                );
              },
              child: const Text('شوف انشاء الانتساب '),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SurnameChanged.routeName);
              },
              child: const Text('شوف ترقيه  الانتساب '),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RenewMember.routeName);
              },
              child: const Text('شوف التجديد الانتساب '),
            ),
          ],
        ),
      ),
    );
  }
}
