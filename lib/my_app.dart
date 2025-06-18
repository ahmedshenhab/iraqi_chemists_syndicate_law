import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iraqi_chemists_syndicate_law/core/lang/localization_service.dart';
import 'package:iraqi_chemists_syndicate_law/core/routing/router.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/theme/app_light_theme.dart';
import 'package:iraqi_chemists_syndicate_law/generated/l10n.dart';
import 'package:iraqi_chemists_syndicate_law/module/test.dart';

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
        initialRoute: Test.routeName,

        builder: (context, child) {
          final localizations = S.of(context);

          LocalizationService.instance.updateLocalizations(localizations);
          return child!;
        },
      ),
    );
  }
}
