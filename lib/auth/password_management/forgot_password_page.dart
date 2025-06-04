import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();


  Future<void> sendForgetPasswordRequest() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    String email = emailController.text.trim();

    final String apiUrl = 'https://yourapi.com/api/Account/forget-password';
    final Map<String, dynamic> data = {
      "email": email,
      "clientUrl": "https://yourapp.com/reset-password"
    };

    try {

      await Future.delayed(Duration(seconds: 2));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم إرسال رابط إعادة تعيين كلمة السر على الإيميل')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ، حاول مرة أخرى')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('نسيت كلمة السر'),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ادخل الإيميل لاستلام رابط إعادة التعيين',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),


              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'الإيميل',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[900]!, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[900]!, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green[700]!, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الإيميل';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                    return 'الرجاء إدخال إيميل صحيح';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),


              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : sendForgetPasswordRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900], // أخضر غامق
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
