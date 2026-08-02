import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextInput extends StatelessWidget {
  final String? upperText;
  final String? text;
  final TextEditingController controller;
  final bool? isPassword;
  final Widget? icon;
  final String? Function(String?)? validator;
  final double? width;
  final bool? showPrefixIcon;
  final void Function(String)? onFieldSubmitted;
  const AppTextInput({super.key, this.upperText, this.text, required this.controller, this.isPassword, this.icon,this.validator,this.width, this.showPrefixIcon,this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 341.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (upperText != null) ...[
            Text(
              upperText!,
              style: Appstyles.black16w500,
            ),
            SizedBox(height: 4.h),
          ],
          TextFormField(
            validator: validator,
            controller: controller,
            obscureText: isPassword ?? false,
            autofocus: false,

            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
          
              hintText: text ?? "",
              hintStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff8391A1),
                
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Color(0xffE8ECF4),
                  width: 1.w
                )
              ),
          
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.w
                )
              ),
          
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.w
                )
              ),
          
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.w
                )
              ),
          
              filled: true,
              fillColor: Color(0xffF7F8F9),
              suffixIcon: icon,
              prefixIcon: showPrefixIcon == true ?  Icon(Icons.search, size: 24.sp,) : null,
          
            ),
            
            
            ),
        ],
      ),
    );
  }
}