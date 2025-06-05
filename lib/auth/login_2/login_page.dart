import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'register_page.dart';
import '../password_management/forget_password_page.dart';



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
  bool _rememberMe = false;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Color getBorderColor(String field, String? value, bool focused) {
    if (value == null || value.isEmpty) {
      return Colors.grey.shade400;
    } else {
      if (field == 'email') {
        bool emailValid = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
        if (!emailValid) return Colors.red;
      }
      if (field == 'password') {
        if (value.length < 6) return Colors.red;
      }
    }
    return focused ? Colors.green.shade700 : Colors.green.shade900;
  }

  InputDecoration buildInputDecoration(
      String label,
      String fieldName,
      TextEditingController controller,
      FocusNode focusNode,
      ) {
    bool isFocused = focusNode.hasFocus;
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontSize: isFocused ? 18 : 16,
        fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
        color: isFocused ? Colors.green.shade800 : Colors.grey[700],
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: getBorderColor(fieldName, controller.text, false)),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: getBorderColor(fieldName, controller.text, true), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final url = Uri.parse('https://chemistssyndicate.runasp.net/api/Account/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
        }),
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SuccessPage()),
        );
      } else {
        final errorMessage = jsonDecode(response.body)['message'] ?? 'فشل تسجيل الدخول';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    Image.asset(
                      'assets/image/png/logo.png',
                      height: 180,
                    ),

                    SizedBox(height: 30),

                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      decoration: buildInputDecoration('البريد الإلكتروني', 'email', _emailController, _emailFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'الرجاء إدخال البريد الإلكتروني';
                        if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'البريد الإلكتروني غير صالح';
                        return null;
                      },
                      onChanged: (_) => setState(() {}),
                    ),

                    SizedBox(height: 25),

                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: _obscurePassword,
                      decoration: buildInputDecoration('كلمة المرور', 'password', _passwordController, _passwordFocusNode).copyWith(
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
                        if (value == null || value.isEmpty) return 'الرجاء إدخال كلمة المرور';
                        if (value.length < 6) return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                        return null;
                      },
                      onChanged: (_) => setState(() {}),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                            ),
                            Text('تذكرني'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ForgetPasswordPage()),
                            );
                          },
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),

                    Spacer(),

                    SizedBox(
                      width: 343,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF116845),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(width: 1, color: Colors.transparent),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        ),
                        onPressed: _isLoading ? null : loginUser,
                        child: _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                          'تسجيل الدخول',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'ليس لديك حساب؟ ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'إنشاء حساب',
                              style: TextStyle(color: Color(0xFF004D40), fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegisterPage()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تم الدخول بنجاح'),
        backgroundColor: Color(0xFF116845),
      ),
      body: Center(
        child: Text(
          'مرحباً بك!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
