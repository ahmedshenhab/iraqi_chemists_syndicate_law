import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String token;

  const ResetPasswordPage({Key? key, required this.email, required this.token}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {

      print('Email: ${widget.email}');
      print('Token: ${widget.token}');
      print('New password: ${_passwordController.text}');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعيين كلمة المرور الجديدة'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('يرجى إدخال كلمة المرور الجديدة'),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور الجديدة',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'يرجى إدخال كلمة المرور';
                  if (value.length < 6) return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'تأكيد كلمة المرور',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value != _passwordController.text) return 'كلمة المرور غير متطابقة';
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submit,
                child: Text('تعيين كلمة المرور'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
