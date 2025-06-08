import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:iraqi_chemists_syndicate_law/core/routing/router.dart';
import 'package:iraqi_chemists_syndicate_law/core/setup.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/theme/app_light_theme.dart';
import 'package:iraqi_chemists_syndicate_law/generated/l10n.dart';
import 'package:iraqi_chemists_syndicate_law/module/membership_registeration/membership_registeration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await setupApp();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());

  //ddddd
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
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
