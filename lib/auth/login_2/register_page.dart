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
                  // أو لو تريد تنتقل مباشرة لصفحة تسجيل الدخول:
                  // Navigator.pushReplacementNamed(context, '/login_page');
                },
                child: Text("حسناً"),
              ),
            ],
          ),
        );
      } else {
        final respBody = jsonDecode(response.body);
        String errorMsg = 'حدث خطأ أثناء التسجيل.';
        if (respBody is Map && respBody.containsKey('Message')) {
          errorMsg = respBody['Message'];
        }
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
                  decoration: buildInputDecoration('الاسم الثلاثي'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                  (value == null || value.isEmpty) ? 'الرجاء إدخال الاسم الثلاثي' : null,
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
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'البريد الإلكتروني غير صالح';
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
                    if (!RegExp(r'^\+?\d{8,15}$').hasMatch(value)) {
                      return 'رقم الهاتف غير صالح';
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
                      return 'كلمة المرور غير متطابقة';
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
                        contentPadding: EdgeInsets.zero,
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
                        contentPadding: EdgeInsets.zero,
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
                      child: Text(
                        'أوافق على الشروط وسياسات الخصوصية',
                        style: TextStyle(fontSize: 16),
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
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 16),


                RichText(
                  text: TextSpan(
                    text: 'لديك حساب بالفعل؟ ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'تسجيل الدخول',
                        style: TextStyle(
                          color: Color(0xFF116845),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login_page');

                            // Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
