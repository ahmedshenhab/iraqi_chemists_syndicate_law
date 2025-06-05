import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyEmailPage extends StatefulWidget {
  final String email;

  const VerifyEmailPage({Key? key, required this.email}) : super(key: key);

  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isLoading = false;

  Future<void> resendEmail() async {
    setState(() {
      isLoading = true;
    });

    final String apiUrl = 'https://chemistssyndicate.runasp.net/api/Account/forget-password';

    final Map<String, dynamic> data = {
      "email": widget.email,
      "clientUrl": "https://chemistssyndicate.runasp.net/reset-password",
      "checkEmail": true,
    };


    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.statusCode == 200
                ? 'تم إعادة إرسال رابط إعادة تعيين كلمة السر على الإيميل'
                : 'حدث خطأ، الرجاء المحاولة مرة أخرى',
          ),
          backgroundColor: response.statusCode == 200 ? Colors.green : Colors.red,
        ),
      );
    } catch (e) {
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
            height: 664,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.asset(
                  'assets/image/png/logo.png',
                  height: 120,
                ),
                SizedBox(height: 30),
                Text(
                  'تحقق من بريدك الإلكتروني',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'اضغط على الرابط الموجود في البريد لتأكيد حسابك.\nلقد أرسلنا رابط تأكيد إلى ${widget.email}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  'لم يصلك البريد الإلكتروني؟',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : resendEmail,
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
                      'إعادة إرسال البريد',
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
        ),
      ),
    );
  }
}
