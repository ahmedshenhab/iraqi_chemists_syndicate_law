import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import '../../membership_registeration/success_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> loginUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://chemistssyndicate.runasp.net/api/Account/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': _emailController.text.trim(),
          'password': _passwordController.text,
        }),
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('تم تسجيل الدخول بنجاح'),
            content: Text('مرحباً ${data['displayName'] ?? 'المستخدم'}!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessPage()),
                  );
                },
                child: Text('حسناً'),
              ),
            ],
          ),
        );
      } else {
        String errorMessage = 'تأكد من البريد الإلكتروني وكلمة المرور ثم حاول مرة أخرى.';
        try {
          final errorData = json.decode(response.body);
          if (errorData is Map && errorData.containsKey('message')) {
            errorMessage = errorData['message'];
          }
        } catch (_) {}

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('فشل تسجيل الدخول'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('إغلاق'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('خطأ'),
          content: Text('حدث خطأ غير متوقع. حاول لاحقاً.\n\n$e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('إغلاق'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  InputDecoration buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        backgroundColor: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green.shade900, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green.shade700, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('تسجيل الدخول'),
          backgroundColor: Colors.green.shade900,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/image/png/logo.png',
                  height: 150,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: buildInputDecoration('البريد الإلكتروني'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال البريد الإلكتروني';
                    }
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'البريد الإلكتروني غير صالح';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: buildInputDecoration('كلمة المرور').copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال كلمة المرور';
                    }
                    if (value.length < 6) {
                      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : loginUser,
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'ليس لديك حساب؟ ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'إنشئ حسابًا الآن',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(context, '/register');
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'هل نسيت كلمة المرور؟',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
