import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

import 'auth/login_2/register_page.dart' as register;
import 'auth/login_2/login_page.dart' as login;
import 'auth/password_management/forget_password_page.dart';
import 'auth/password_management/reset_password_page.dart';
import 'auth/password_management/VerifyEmailPage.dart';
import '../auth/password_management/PasswordResetSuccessPage.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription? _sub;

  static const platform = MethodChannel("deep_link_channel");

  bool _navigatedAlready = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleInitialDeepLink();
    });

    _listenToDeepLinks();
    _listenToPlatformChannel();
  }

  Future<void> _handleInitialDeepLink() async {
    try {
      final String? link = await platform.invokeMethod('getInitialLink');
      if (link != null) {
        print('🚀 Initial link from platform: $link');
        _navigateFromUri(Uri.parse(link));
      }
    } on PlatformException catch (e) {
      print('❌ Failed to get initial link from Android: $e');
    }
  }

  void _listenToDeepLinks() {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        print('🔔 Runtime deep link received: $uri');
        _navigateFromUri(uri);
      }
    }, onError: (err) {
      print('❌ URI Stream error: $err');
    });
  }

  void _listenToPlatformChannel() {
    platform.setMethodCallHandler((call) async {
      if (call.method == 'onDeepLinkReceived') {
        final String? link = call.arguments;
        if (link != null) {
          print('📲 Deep link received via MethodChannel: $link');
          _navigateFromUri(Uri.parse(link));
        }
      }
    });
  }

  void _navigateFromUri(Uri uri) {
    if (_navigatedAlready) {
      print('⚠️ Already navigated, ignoring this deep link.');
      return;
    }
    _navigatedAlready = true;

    print('🔗 Received URI: $uri');

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (navigatorKey.currentState == null) {
        print('❗ navigatorKey.currentState is null');
        return;
      }

      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/reset-password',
            (route) => false,
        arguments: {
          'email': uri.queryParameters['email'] ?? '',
          'token': uri.queryParameters['token'] ?? '',
        },
      );

    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'نقابة الصيادلة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),


      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },

      initialRoute: '/login',
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        switch (settings.name) {
          case '/register':
            return MaterialPageRoute(builder: (_) => register.RegisterPage());

          case '/login':
            return MaterialPageRoute(builder: (_) => login.LoginPage());

          case '/forgot-password':
            return MaterialPageRoute(builder: (_) => ForgetPasswordPage());

          case '/reset-password':
            if (args is Map<String, dynamic> &&
                args.containsKey('email') &&
                args.containsKey('token')) {
              return MaterialPageRoute(
                builder: (_) => ResetPasswordPage(
                  email: args['email'],
                  token: args['token'],
                ),
              );
            }
            return MaterialPageRoute(builder: (_) => login.LoginPage());

          case '/verify-email':
            if (args is Map<String, dynamic> && args.containsKey('email')) {
              return MaterialPageRoute(
                builder: (_) => VerifyEmailPage(email: args['email']),
              );
            }
            return MaterialPageRoute(builder: (_) => login.LoginPage());

          default:
            return MaterialPageRoute(builder: (_) => login.LoginPage());
        }
      },
    );
  }
}
