import 'package:flutter/material.dart';
import 'auth/login 2/register_page.dart';
import 'auth/login 2/login_page.dart';
import 'auth/email_verification/email_confirmation_page.dart';
import 'auth/password_management/forgot_password_page.dart';  // صفحة نسيت كلمة المرور
import 'auth/password_management/reset_password_page.dart';   // ✅ صفحة إعادة تعيين كلمة السر

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نقابة الصيادلة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Arial',
      ),
      initialRoute: '/login',

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/register':
            return MaterialPageRoute(builder: (context) => RegisterPage());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginPage());
          case '/emailConfirmation':
            return MaterialPageRoute(builder: (context) => EmailConfirmationPage());
          case '/forgot-password':
            return MaterialPageRoute(builder: (context) => ForgetPasswordPage());
          case '/reset-password':
            final args = settings.arguments as Map<String, dynamic>?;

            if (args != null && args.containsKey('email') && args.containsKey('token')) {
              return MaterialPageRoute(
                builder: (context) => ResetPasswordPage(
                  email: args['email'],
                  token: args['token'],
                ),
              );
            }

            return MaterialPageRoute(builder: (context) => LoginPage());
          default:

            return MaterialPageRoute(builder: (context) => LoginPage());
        }
      },
    );
  }
}
