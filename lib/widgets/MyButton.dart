import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final IconData? icon;
  final bool? side;
  final void Function()? onPressed;
  const MyButton({super.key,required this.text, this.icon,this.width,this.side, required this.onPressed,this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
       style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondaryColor,
        fixedSize: Size(width ?? 325 , height ?? 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.r),
        ),
        
       ),
       child:getWidgets(),
    );
  }


  Widget getWidgets(){
    if(side==null){
      return Text(text, style: Appstyles.black14w600.copyWith(color: Colors.white));
    }

  
    return Row(
      children: [
        side==true ? Icon(icon) : SizedBox.shrink(),
        side == true ? SizedBox(width: 10.w) : SizedBox.shrink(),
        Text(text),
        side==false ? Icon(icon) : SizedBox.shrink(),
        side == false ? SizedBox(width: 10.w) : SizedBox.shrink(),
      ],
    ) ;
  }
}