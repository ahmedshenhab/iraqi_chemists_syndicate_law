import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _mobileController = TextEditingController();

  bool _acceptedTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? _isMember;

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى الموافقة على الشروط وسياسات الخصوصية')),
      );
      return;
    }

    if (_isMember == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى اختيار هل أنت منتسب من قبل')),
      );
      return;
    }

    final url = Uri.parse('https://chemistssyndicate.runasp.net/api/Account/register');

    var request = http.MultipartRequest('POST', url);
    request.fields['Email'] = _emailController.text.trim();
    request.fields['Password'] = _passwordController.text;
    request.fields['ConfirmPassword'] = _confirmPasswordController.text;
    request.fields['FullName'] = _fullNameController.text.trim();
    request.fields['Mobile'] = _mobileController.text.trim();

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');


      if (response.statusCode == 200 || response.statusCode == 201) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("تم التسجيل بنجاح"),
            content: Text("تم إنشاء حسابك بنجاح. يمكنك تسجيل الدخول الآن."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // تغلق الرسالة
                  Navigator.pop(context); // ترجع لصفحة تسجيل الدخول أو الصفحة السابقة
                },
                child: Text("حسناً"),
              ),
            ],
          ),
        );
      } else {
        String errorMsg = 'حدث خطأ أثناء التسجيل.';
        try {
          final respBody = jsonDecode(response.body);

          // لو الخطأ موجود في ModelState (أكثر من خطأ أو تفاصيل)
          if (respBody is Map && respBody.containsKey('errors')) {
            final errors = respBody['errors'];
            if (errors is Map) {
              errorMsg = errors.values
                  .map((e) => e is List ? e.join('\n') : e.toString())
                  .join('\n');
            }
          } else if (respBody is Map && respBody.containsKey('Message')) {
            errorMsg = respBody['Message'];
          } else if (respBody is String) {
            errorMsg = respBody;
          }
        } catch (_) {}

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("خطأ"),
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
        borderSide: BorderSide(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality( // دي الجزء اللي بيخلي الواجهة تشتغل RTL
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
                height: 120,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'إنشاء حساب',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: _fullNameController,
                  decoration: buildInputDecoration('الاسم الثلاثي باللغة العربية'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textDirection: TextDirection.rtl, // عشان النص يكتب من اليمين لليسار
                  keyboardType: TextInputType.text,  // نوع الكيبورد نصي عادي
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم الثلاثي';
                    }
                    if (!RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(value)) {
                      return 'يجب أن يحتوي الاسم على أحرف عربية فقط بدون أرقام أو رموز';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: _emailController,
                  decoration: buildInputDecoration('البريد الإلكتروني'),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال البريد الإلكتروني';
                    }
                    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(value)) {
                      return 'البريد الإلكتروني غير صالح يجب أن يشابه name@gmail.com';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: _mobileController,
                  decoration: buildInputDecoration('رقم الهاتف'),
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال رقم الهاتف';
                    }
                    if (!RegExp(r'^\d{10,}$').hasMatch(value)) {
                      return 'رقم الهاتف يجب أن يحتوي على 10 أرقام على الأقل';
                    }
                    return null;
                  },

                ),
                const SizedBox(height: 15),

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
                    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*]).{6,}$').hasMatch(value)) {
                      return 'كلمة المرور يجب أن تحتوي على حرف صغير، حرف كبير، رقم، وحرف خاص'
                          ' (!@#\$%^&*)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

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
                      return 'كلمة المرور وتأكيدها غير متطابقين';
                    }
                    return null;
                  },

                ),

                const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'هل أنت منتسب من قبل؟',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RadioListTile<String>(
                          title: const Text('نعم'),
                          value: 'yes',
                          groupValue: _isMember,
                          onChanged: (value) {
                            setState(() {
                              _isMember = value;
                            });
                          },
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          activeColor: Color(0xFF81C784), // أخضر فاتح
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RadioListTile<String>(
                          title: const Text('لا'),
                          value: 'no',
                          groupValue: _isMember,
                          onChanged: (value) {
                            setState(() {
                              _isMember = value;
                            });
                          },
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 4),
                          activeColor: Color(0xFF81C784), // أخضر فاتح
                        ),
                      ),
                    ],
                  ),

                  Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptedTerms = value ?? false;
                        });
                      },
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: 'أوافق على ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'الشروط',
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // افتح صفحة الشروط هنا
                                },
                            ),
                            TextSpan(
                              text: ' و سياسات ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'الخصوصية',
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // افتح صفحة الخصوصية هنا
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(343, 48),
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                    backgroundColor: Color(0xFF116845),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(width: 1),
                    ),
                  ),
                  child: Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    text: 'لديك حساب بالفعل؟ ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context); // أو استخدمي الانتقال لصفحة تسجيل الدخول
                            // Navigator.pushNamed(context, '/login');
                          },
                      ),
                    ],
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
