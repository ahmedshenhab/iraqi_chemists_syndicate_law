import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailConfirmationPage extends StatefulWidget {
  final String? email;
  final String? token;

  const EmailConfirmationPage({Key? key, this.email, this.token}) : super(key: key);

  @override
  _EmailConfirmationPageState createState() => _EmailConfirmationPageState();
}

class _EmailConfirmationPageState extends State<EmailConfirmationPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _tokenController = TextEditingController();

  bool _isLoading = false;
  bool _autoConfirmStarted = false;

  @override
  void initState() {
    super.initState();
    if (widget.email != null) _emailController.text = widget.email!;
    if (widget.token != null) _tokenController.text = widget.token!;

    // نفذ التأكيد تلقائيًا إذا البريد والرمز موجودين ولم يبدأ بعد
    if (widget.email != null && widget.token != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_autoConfirmStarted) {
          _autoConfirmStarted = true;
          confirmEmail();
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    if (args != null) {
      if (args['email'] != null) _emailController.text = args['email'];
      if (args['token'] != null) _tokenController.text = args['token'];
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

  Future<void> confirmEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://chemistssyndicate.runasp.net/api/Account/ConfirmEmail');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text.trim(),
          'token': _tokenController.text.trim(),
        }),
      );

      final respBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('تم التأكيد بنجاح'),
            content: Text('تم تأكيد البريد الإلكتروني بنجاح. يمكنك الآن تسجيل الدخول.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('حسناً'),
              ),
            ],
          ),
        );
      } else {
        String errorMsg = 'حدث خطأ أثناء تأكيد البريد الإلكتروني.';
        if (respBody is Map && respBody.containsKey('Message')) {
          errorMsg = respBody['Message'];
        }
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('فشل التأكيد'),
            content: Text(errorMsg),
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
          content: Text('حدث خطأ غير متوقع. حاول مرة أخرى لاحقاً.'),
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

  @override
  Widget build(BuildContext context) {
    final hasAutoValues = widget.email != null && widget.token != null;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('تأكيد البريد الإلكتروني'),
          backgroundColor: Colors.green.shade900,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  hasAutoValues
                      ? 'جارٍ تأكيد بريدك الإلكتروني...'
                      : 'يرجى إدخال البريد الإلكتروني ورمز التأكيد الذي وصلك عبر البريد.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // البريد الإلكتروني
                TextFormField(
                  controller: _emailController,
                  decoration: buildInputDecoration('البريد الإلكتروني'),
                  keyboardType: TextInputType.emailAddress,
                  readOnly: widget.email != null,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'الرجاء إدخال البريد الإلكتروني';
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'البريد الإلكتروني غير صالح';
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // رمز التأكيد
                TextFormField(
                  controller: _tokenController,
                  decoration: buildInputDecoration('رمز التأكيد'),
                  readOnly: widget.token != null,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'الرجاء إدخال رمز التأكيد';
                    return null;
                  },
                ),

                SizedBox(height: 25),
                if (!hasAutoValues) // إذا القيم وصلت من الديب لينك، لا نحتاج زر
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : confirmEmail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('تأكيد البريد الإلكتروني', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
