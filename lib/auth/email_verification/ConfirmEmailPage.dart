import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConfirmEmailPage extends StatefulWidget {
  @override
  _ConfirmEmailPageState createState() => _ConfirmEmailPageState();
}

class _ConfirmEmailPageState extends State<ConfirmEmailPage> {
  final _emailController = TextEditingController();
  final _tokenController = TextEditingController();

  bool _isLoading = false;

  Future<void> confirmEmail() async {
    final url = Uri.parse('https://chemistssyndicate.runasp.net/api/Account/confirm-email');

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text.trim(),
          'token': _tokenController.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('تم التفعيل'),
            content: Text('تم تأكيد بريدك الإلكتروني بنجاح!'),
            actions: [
              TextButton(
                child: Text('تسجيل الدخول'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('فشل التفعيل'),
            content: Text('تأكد من صحة البريد أو رمز التفعيل'),
            actions: [
              TextButton(child: Text('حسناً'), onPressed: () => Navigator.pop(context)),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('خطأ'),
          content: Text('حدث خطأ ما. حاول مجددًا.'),
          actions: [
            TextButton(child: Text('إغلاق'), onPressed: () => Navigator.pop(context)),
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
    return Scaffold(
      appBar: AppBar(title: Text('تأكيد البريد الإلكتروني'), backgroundColor: Colors.green.shade900),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _tokenController,
              decoration: InputDecoration(labelText: 'رمز التفعيل (Token)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : confirmEmail,
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('تأكيد'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
