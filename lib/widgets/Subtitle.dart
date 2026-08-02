import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Subtitle extends StatelessWidget {

  final String subtitle;
  const Subtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 335.w,
      child: Text(subtitle, style: Appstyles.grey16w400),
      );
  }
}