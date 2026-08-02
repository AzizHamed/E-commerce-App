import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterWidget extends StatelessWidget{

  final Icon icon;
  final void Function() onPressed;
  const CounterWidget({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor: AppColors.secondaryColor,
                            fixedSize: Size(23.w, 23.h),
                            shape: BeveledRectangleBorder(
                              side: BorderSide(
                                color: Color(0xffCCCCCC),
                                width: 0.6.w
                              ),
                            )
                           ),
                           onPressed: onPressed,
                           child: icon
                           
                          );
  }
}