import 'package:flutter/material.dart';
import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

import 'auth/login_2/register_page.dart' as register;
import 'auth/login_2/login_page.dart' as login;
import 'auth/password_management/forget_password_page.dart';
import 'auth/password_management/reset_password_page.dart';
import 'auth/password_management/VerifyEmailPage.dart';

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

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  void _initDeepLinks() async {
    try {
      final uri = await getInitialUri();
      if (uri != null) {
        _navigateFromUri(uri);
      }
    } on PlatformException {
      print('PlatformException: Failed to get initial URI');
    } on FormatException {
      print('FormatException: Malformed initial URI');
    }

    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) _navigateFromUri(uri);
    }, onError: (err) {
      print('URI Stream error: $err');
    });
  }

  void _navigateFromUri(Uri uri) {
    print('Received URI: $uri');
    print('Path: ${uri.path}');
    print('Query parameters: ${uri.queryParameters}');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (uri.path == '/reset-password') {
        final email = uri.queryParameters['email'];
        final token = uri.queryParameters['token'];
        print('Reset password - Email: $email, Token: $token');
        if (email != null && token != null) {
          navigatorKey.currentState?.pushNamed(
            '/reset-password',
            arguments: {'email': email, 'token': token},
          );
        }
      } else if (uri.path == '/confirm-email') {
        final email = uri.queryParameters['email'];
        print('Confirm email - Email: $email');
        if (email != null) {
          navigatorKey.currentState?.pushNamed(
            '/verify-email',
            arguments: {'email': email},
          );
        }
      }
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
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        print('Navigating to: ${settings.name}');

        switch (settings.name) {
          case '/register':
            return MaterialPageRoute(builder: (_) => register.RegisterPage());
          case '/login':
            return MaterialPageRoute(builder: (_) => login.LoginPage());
          case '/forgot-password':
            return MaterialPageRoute(builder: (_) => ForgetPasswordPage());
          case '/reset-password':
            final args = settings.arguments as Map<String, dynamic>?;
            if (args != null &&
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
            final args = settings.arguments as Map<String, dynamic>?;
            if (args != null && args.containsKey('email')) {
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
