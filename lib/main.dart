import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iraqi_chemists_syndicate_law/core/routing/router.dart';
import 'package:iraqi_chemists_syndicate_law/core/setup.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/theme/app_light_theme.dart';
import 'package:iraqi_chemists_syndicate_law/generated/l10n.dart';
import 'package:iraqi_chemists_syndicate_law/membership_registeration/membership_registeration_screen.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());

  //ddddd
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.lighTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ar'),
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: MembershipRegisterationScreen.routeName,
      ),
    );
  }
}
// دا كومنت
// تاني