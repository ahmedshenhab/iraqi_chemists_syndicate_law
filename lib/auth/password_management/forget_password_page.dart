import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../password_management/VerifyEmailPage.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Color borderColor = Colors.grey.shade400;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateBorderColor);
    emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  void _updateBorderColor() {
    final value = emailController.text;
    if (value.isEmpty) {
      borderColor = Colors.grey.shade400;
    } else if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value) ||
        RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
      borderColor = Colors.green.shade700;
    } else {
      borderColor = Colors.black;
    }
    setState(() {});
  }

  Future<void> sendForgetPasswordRequest() async {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate()) return;

    setState(() {
      isLoading = true;
    });

    final String email = emailController.text.trim();
    final String apiUrl = 'https://chemistssyndicate.runasp.net/api/Account/forget-password';

    final Map<String, dynamic> data = {
      "email": email,
      "clientUrl": "https://chemistssyndicate.runasp.net/reset-password"
    };

    try {
      final response = await http.post(
        Uri.parse('https://chemistssyndicate.runasp.net/api/Account/forget-password'),
        headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "email": emailController.text,
            "clientUrl": "https://chemistssyndicate.runasp.net/reset-password",
          }),


      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyEmailPage(email: email),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ، الرجاء المحاولة مرة أخرى\n${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ، الرجاء المحاولة مرة أخرى'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.removeListener(_updateBorderColor);
    emailController.dispose();
    emailFocusNode.dispose();
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

            margin: EdgeInsets.only(top: 20),
            child: SingleChildScrollView(  // أضفت SingleChildScrollView
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/png/logo.png',
                    height: 120,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'هل نسيت كلمة المرور؟',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'لا تقلق، يحدث ذلك للجميع.\nأدخل بريدك الإلكتروني أدناه لاستعادة كلمة المرور الخاصة بك.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      decoration: InputDecoration(
                        labelText: 'البريد الإلكتروني أو الهاتف',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: TextStyle(
                          color: emailFocusNode.hasFocus
                              ? Colors.green.shade800
                              : Colors.grey[700],
                          fontSize: 16,
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء إدخال البريد الإلكتروني أو الهاتف';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value) &&
                            !RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
                          return 'الرجاء إدخال بريد إلكتروني أو رقم هاتف صحيح';
                        }
                        return null;
                      },
                      onChanged: (_) => setState(() {}),
                    ),
                  ),

                  SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : sendForgetPasswordRequest,
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
                        'إرسال',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
