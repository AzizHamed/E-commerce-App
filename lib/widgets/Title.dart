import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 335.w,
      child: Text(title, style: Appstyles.black32w600),
      );
  }
}