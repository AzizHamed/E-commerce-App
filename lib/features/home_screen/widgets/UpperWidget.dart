import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/features/authentication/widgets/AppTextInput.dart';
import 'package:ecommerce_app/widgets/Title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpperWidget extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String) onFieldSubmitted;
  const UpperWidget({super.key, required this.searchController, required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 59.h,),
              TitleWidget(title: "Discover"),
              SizedBox(height: 16.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTextInput(controller: searchController, width:  281.w, showPrefixIcon: true, text: "Search for clothes...",onFieldSubmitted: onFieldSubmitted,),
                  SizedBox(width: 8.w,),
                  Container(
                    height: 52.h,
                    width: 52.w,
                    color: AppColors.primaryColor,
                    alignment: Alignment.center,
                    child: Icon(Icons.tune, color: AppColors.secondaryColor, size: 24.sp,),
                  ),
                  
                ],
              ),
      ],
    );
  }
}