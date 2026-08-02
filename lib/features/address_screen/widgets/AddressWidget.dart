import 'package:ecommerce_app/core/entities/Address.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidget extends StatelessWidget {
  final Address address;

  const AddressWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341.w,
      height: 76.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Color(0xffE6E6E6),
          width: 1
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.location_on_outlined, size: 24.sp, color: Color(0xff999999),),
          SizedBox(width: 11.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(address.city, style: Appstyles.black14w600),
              SizedBox(height: 4.h,),
              Text(address.street, style: Appstyles.grey16w400.copyWith(color: Color(0xff808080), fontSize: 14.sp),)
            ],
          )
        ],
      ),
    );
  }
}