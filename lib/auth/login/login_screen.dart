
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const loginScreen = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // التاريخ الابتدائي
      firstDate: DateTime(1900), // أقل تاريخ يمكن اختياره
      lastDate: DateTime.now(), // أقصى تاريخ يمكن اختياره
      locale: const Locale('ar'), // لجعل التقويم عربي (مهم)
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
        ),
      ),
    );
  }
}
