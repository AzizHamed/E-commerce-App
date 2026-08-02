import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyValueRow extends StatelessWidget {
  final String key1;
  final String value;
  const KeyValueRow({super.key, required this.key1, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Text(key1, style: Appstyles.grey16w400.copyWith(color: AppColors.gray2Color),),
          Text(value, style: Appstyles.black16w500,),
        ],
      ),
    );
  }
}