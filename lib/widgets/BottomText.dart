import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function() method;
  const BottomText({super.key, required this.firstText,required this.secondText,required this.method});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: Appstyles.black16w500.copyWith(color: AppColors.grayColor),
        children: [
          TextSpan(
            text: secondText,
            style: Appstyles.black16w500.copyWith(
              decoration: TextDecoration.underline
            ),

            recognizer: TapGestureRecognizer()..onTap = method
            
          )
        ]
      ),
      
       );
  }
}