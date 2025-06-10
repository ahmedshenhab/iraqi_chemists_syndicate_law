import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PasswordResetSuccessPage.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String token;

  ResetPasswordPage({required this.email, required this.token, Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  bool _showPasswordInfo = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool isPasswordComplex(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*]).{6,}$');
    return regex.hasMatch(password);
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasswordResetSuccessPage()),
        );
      } else {
        String errorMessage = 'حدث خطأ، الرجاء المحاولة مرة أخرى';
        try {
          final responseBody = jsonDecode(response.body);
          if (responseBody is Map && responseBody.containsKey('message')) {
            errorMessage = responseBody['message'];
          }
        } catch (_) {}

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ، الرجاء المحاولة مرة أخرى')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  OutlineInputBorder getOutlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 1.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset('assets/image/png/logo.png', height: 150),
                    SizedBox(height: 20),
                    Text(
                      'تعيين كلمة المرور',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'تمت إعادة تعيين كلمة المرور السابقة. يرجى تعيين كلمة مرور جديدة لحسابك.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: passwordController,
                            obscureText: _isPasswordHidden,
                            onChanged: (_) {
                              setState(() {
                                _showPasswordInfo = true;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'إنشاء كلمة مرور',
                              labelStyle: TextStyle(color: Color(0xFF116845)),
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden = !_isPasswordHidden;
                                  });
                                },
                              ),
                              enabledBorder: getOutlineBorder(Colors.grey),
                              focusedBorder: getOutlineBorder(Color(0xFF116845)),
                              errorBorder: getOutlineBorder(Colors.red),
                              focusedErrorBorder: getOutlineBorder(Colors.red),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'الرجاء إدخال كلمة المرور الجديدة';
                              }
                              if (!isPasswordComplex(value.trim())) {
                                return 'كلمة المرور غير قوية بما فيه الكفاية';
                              }
                              return null;
                            },
                          ),
                          if (_showPasswordInfo)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'كلمة المرور يجب أن تحتوي على حرف صغير، حرف كبير، رقم، حرف خاص (!@#%^&*) وتكون 6 أحرف على الأقل.',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: _isConfirmPasswordHidden,
                            decoration: InputDecoration(
                              labelText: 'أعد إدخال كلمة المرور',
                              labelStyle: TextStyle(color: Color(0xFF116845)),
                              suffixIcon: IconButton(
                                icon: Icon(_isConfirmPasswordHidden ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
                                  });
                                },
                              ),
                              enabledBorder: getOutlineBorder(Colors.grey),
                              focusedBorder: getOutlineBorder(Color(0xFF116845)),
                              errorBorder: getOutlineBorder(Colors.red),
                              focusedErrorBorder: getOutlineBorder(Colors.red),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إعادة إدخال كلمة المرور';
                              }
                              if (value != passwordController.text) {
                                return 'كلمة المرور وتأكيدها غير متطابقين';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : resetPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF116845),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      'تعيين كلمة المرور',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
