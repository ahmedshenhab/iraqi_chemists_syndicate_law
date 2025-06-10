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
      borderColor = Colors.red.shade700;
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
    final String apiUrl =
        'https://chemistssyndicate.runasp.net/api/Account/forget-password';

    final Map<String, dynamic> data = {
      "email": email,
      "clientUrl": "https://rewan120.github.io/reset-password-page/"
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
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
        String errorMessage = 'حدث خطأ، الرجاء المحاولة مرة أخرى';
        try {
          final responseBody = jsonDecode(response.body);
          if (responseBody is Map<String, dynamic>) {
            if (responseBody.containsKey('message')) {
              errorMessage = responseBody['message'];
            } else if (responseBody.containsKey('errors')) {
              errorMessage = responseBody['errors'].toString();
            }
          }
        } catch (_) {}

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: 343,
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image/png/logo.png',
                          height: 120,
                        ),
                        SizedBox(height: 25),
                        Text(
                          'هل نسيت كلمة المرور؟',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'لا تقلق، يحدث ذلك للجميع.\nأدخل بريدك الإلكتروني أدناه لاستعادة كلمة المرور الخاصة بك.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child:TextFormField(
                            controller: emailController,
                            focusNode: emailFocusNode,
                            decoration: InputDecoration(
                              labelText: 'البريد الإلكتروني ',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              labelStyle: TextStyle(
                                color: emailFocusNode.hasFocus
                                    ? Colors.green.shade900
                                    : Colors.grey[700],
                                fontSize: 20,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8), // تعديل البادينج
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: borderColor,
                                  width: 1, // border-width: 1px
                                ),
                                borderRadius: BorderRadius.circular(8), // border-radius: 8px
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: borderColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال البريد الإلكتروني ';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value) &&
                                  !RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) {
                                return 'الرجاء إدخال بريد إلكتروني  صحيح';
                              }
                              return null;
                            },
                            onChanged: (_) => setState(() {}),


                        ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Color(0xFF116845)),
                        label: Text(
                          'السابق',
                          style: TextStyle(
                            color: Color(0xFF116845),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color(0xFF116845)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: isLoading ? null : sendForgetPasswordRequest,
                        icon: Icon(Icons.send, color: Colors.white),
                        label: isLoading
                            ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        )
                            : Text(
                          'إرسال',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF116845),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
