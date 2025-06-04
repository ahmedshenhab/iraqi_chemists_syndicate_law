import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();

  bool _acceptedTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى الموافقة على الشروط وسياسات الخصوصية')),
      );
      return;
    }

    final url = Uri.parse('https://chemistssyndicate.runasp.net/api/Account/register');

    final body = jsonEncode({
      "Email": _emailController.text.trim(),
      "Password": _passwordController.text,
      "ConfirmPassword": _confirmPasswordController.text,
      "FirstName": _firstNameController.text.trim(),
      "LastName": _lastNameController.text.trim(),
      "Mobile": _mobileController.text.trim(),
      "FullName": '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
    });

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("تم التسجيل بنجاح"),
            content: Text("يمكنك الآن تسجيل الدخول."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("حسناً"),
              ),
            ],
          ),
        );
      } else {
        String errorMsg = 'حدث خطأ أثناء التسجيل. يرجى التأكد من صحة البيانات.';
        try {
          final decoded = json.decode(response.body);
          if (decoded is Map && decoded.containsKey('Message')) {
            errorMsg = decoded['Message'];
          } else if (decoded is Map && decoded.containsKey('errors')) {
            errorMsg = (decoded['errors'] as Map).values.map((e) => (e as List).join('\n')).join('\n');
          }
        } catch (_) {}

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("فشل التسجيل"),
            content: Text(errorMsg),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("إغلاق"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("خطأ"),
          content: Text("حدث خطأ غير متوقع. حاول مرة أخرى لاحقاً."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("إغلاق"),
            ),
          ],
        ),
      );
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
        borderSide: BorderSide(color: Colors.green, width: 2),
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
        appBar: AppBar(title: Text('إنشاء حساب')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/image/png/logo.png',
                    height: 160,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'إنشاء حساب',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: _firstNameController,
                  decoration: buildInputDecoration('الاسم الأول'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  (value == null || value.isEmpty) ? 'الرجاء إدخال الاسم الأول' : null,
                ),
                const SizedBox(height: 10),

                TextFormField(
                  controller: _lastNameController,
                  decoration: buildInputDecoration('اسم العائلة'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  (value == null || value.isEmpty) ? 'الرجاء إدخال اسم العائلة' : null,
                ),
                const SizedBox(height: 10),

                TextFormField(
                  controller: _emailController,
                  decoration: buildInputDecoration('البريد الإلكتروني'),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                const SizedBox(height: 10),

                TextFormField(
                  controller: _mobileController,
                  decoration: buildInputDecoration('رقم الهاتف'),
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم الهاتف';
                    }
                    if (!RegExp(r'^\+?\d{8,15}$').hasMatch(value)) {
                      return 'رقم الهاتف غير صالح';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                TextFormField(
                  controller: _passwordController,
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
                  obscureText: _obscurePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                const SizedBox(height: 10),

                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: buildInputDecoration('تأكيد كلمة المرور').copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureConfirmPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء تأكيد كلمة المرور';
                    }
                    if (value != _passwordController.text) {
                      return 'كلمة المرور غير متطابقة';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: _acceptedTerms,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _acceptedTerms = newValue ?? false;
                          });
                        },
                        activeColor: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'أوافق على جميع ',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(
                              text: 'الشروط',
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' و'),
                            TextSpan(
                              text: 'سياسات الخصوصية',
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'إنشاء حساب',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
