import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 120,
                color: Colors.green.shade700,
              ),
              SizedBox(height: 20),
              Text(
                'تم التسجيل الدخول بنجاح',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
