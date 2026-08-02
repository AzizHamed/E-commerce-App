import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:ecommerce_app/features/address_screen/widgets/AddressWidget.dart';
import 'package:ecommerce_app/features/provider/AppBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      appBar: AppBar(
          toolbarHeight: 79.h,
          backgroundColor: AppColors.secondaryColor,
          leading: Padding(
            padding: EdgeInsets.only(top: 38.h, left: 10.w),
            child: IconButton(onPressed: ()=>GoRouter.of(context).pop(), icon: const Icon(Icons.arrow_back)),
          ),
          title: Padding(
            padding:  EdgeInsets.only(top: 40.h,),
            child: Text("Address", style: Appstyles.black24w600),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(padding: 
        EdgeInsetsGeometry.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h,),
            Divider(color: Color(0xffE6E6E6),),
            SizedBox(height: 25.h,),
            Text("Saved Address", style: Appstyles.black16w500,),
            SizedBox(height: 14.h,),
            AddressWidget(address: context.watch<AppBloc>().state.signedInUser!.address ,)
          ],
        ),
        ),
    )
    );
  }
}