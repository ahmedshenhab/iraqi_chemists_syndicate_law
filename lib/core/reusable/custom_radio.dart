import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.activeColor = Colors.teal,
  });

  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String label;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>.adaptive(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: activeColor,
        ),
        SizedBox(width: 20.w, child: Text(label)),
      ],
    );
  }
}
