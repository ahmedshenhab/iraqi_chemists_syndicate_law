import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_color.dart';
import 'package:iraqi_chemists_syndicate_law/core/ui/style/app_text_style.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Image.asset('assets/image/png/logo.png', width: 80.w, height: 102.h),
          SizedBox(height: 128.h),
          SvgPicture.asset('assets/image/svg/done.svg', height: 206.h),
          SizedBox(height: 32.h),
          Text(
            'تم تسجيل طلب الانتساب بنجاح',
            style: AppTextStyle.bold14.copyWith(color: AppColor.black),
          ),
        ],
      ),
    );
  }
}

