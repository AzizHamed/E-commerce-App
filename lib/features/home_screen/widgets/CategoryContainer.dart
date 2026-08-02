import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContainer extends StatelessWidget {

  final String text;
  final Color selectedbackgroundColor;
  final void Function()? method;
  const CategoryContainer({super.key,required this.selectedbackgroundColor, required this.text, required this.method });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedbackgroundColor ,
        // elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        foregroundColor: selectedbackgroundColor == AppColors.primaryColor ? AppColors.secondaryColor : AppColors.blackColor,
        textStyle: selectedbackgroundColor == AppColors.primaryColor ? Appstyles.black16w500.copyWith(color: AppColors.secondaryColor) : Appstyles.black16w500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.r),
          side: BorderSide(
            color: Color(0xffE6E6E6),
            width: 1,
          )
          
        )
      ),
      onPressed: method,
       child: Text(text)
       );
  }
}