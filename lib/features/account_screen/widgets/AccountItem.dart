import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget divider;
  final String router;
  const AccountItem({super.key, required this.icon, required this.title,required this.divider, required this.router});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.h),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Row(
              
              children: [
                Icon(icon, size: 24.sp,color: AppColors.blackColor),
                SizedBox(width: 6.w,),
                Text(title, style: Appstyles.black16w500,),
                Spacer(),
                IconButton(
                  onPressed: () => GoRouter.of(context).pushNamed(router),
                 icon: Icon(Icons.arrow_forward, size: 24, color: AppColors.gray2Color,)),
              ],
            ),
            SizedBox(height: 25.h,),
            divider
          ],
        ),
      ),
    );
  }
}