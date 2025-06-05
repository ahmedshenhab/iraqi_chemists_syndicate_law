import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String token;

  ResetPasswordPage({required this.email, required this.token});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  Future<void> resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    final apiUrl = 'https://chemistssyndicate.runasp.net/api/Account/reset-password';

    final data = {
      "email": widget.email,
      "password": passwordController.text.trim(),
      "confirmPassword": confirmPasswordController.text.trim(),
      "token": widget.token,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم تعيين كلمة المرور بنجاح')),
        );

        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } else {
        String errorMessage = 'حدث خطأ، الرجاء المحاولة مرة أخرى';
        try {
          final responseBody = jsonDecode(response.body);
          if (responseBody is Map && responseBody.containsKey('message')) {
            errorMessage = responseBody['message'];
          }
        } catch (_) {

        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ، الرجاء المحاولة مرة أخرى')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Container(
            width: 343,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),

                  // اللوجو في النص فوق
                  Center(
                    child: Image.asset(
                      'assets/image/png/logo.png',
                      height: 120,
                    ),
                  ),

                  SizedBox(height: 30),
                  Text(
                    'تعيين كلمة المرور',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'تمت إعادة تعيين كلمة المرور السابقة. يرجى تعيين كلمة مرور جديدة لحسابك.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 40),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'إنشاء كلمة مرور',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.green.shade700, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'الرجاء إدخال كلمة المرور الجديدة';
                            }
                            if (value.trim().length < 6) {
                              return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 16),

                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'أعد إدخال كلمة المرور',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey.shade400, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.green.shade700, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'الرجاء إعادة إدخال كلمة المرور';
                            }
                            if (value != passwordController.text) {
                              return 'كلمة المرور غير متطابقة';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 40),

                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : resetPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF116845),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                              'تعيين كلمة المرور',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
