import 'package:ecommerce_app/core/router/AppRouters.dart';
import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:ecommerce_app/features/account_screen/widgets/AccountItem.dart';
import 'package:ecommerce_app/features/main_screen/provider/MainScreenBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Divider divider = Divider(color: Color(0xffE6E6E6));
    final Widget divider2 = Divider(color: Color(0xffAAAAAA), thickness: 8,);
    final Divider divider3 = Divider(color: Color.fromARGB(255, 230, 230, 230), thickness: 8,);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 79.h,
          backgroundColor: AppColors.secondaryColor,
          leading: Padding(
            padding: EdgeInsets.only(top: 38.h, left: 10.w),
            child: IconButton(onPressed: (){context.read<MainScreenBloc>().selectBottomBarItem(0);}, icon: const Icon(Icons.arrow_back)),
          ),
          title: Padding(
            padding:  EdgeInsets.only(top: 40.h,),
            child: Text("Account", style: Appstyles.black24w600),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w) ,
                child: Divider(color: Color(0xffE6E6E6),),
              ),
          
              AccountItem(icon: Icons.inventory_2_outlined, title: "My Orders", divider: divider2 , router: AppRouters.addressScreen, ),
              AccountItem(icon: Icons.person_add_alt_1_outlined, title: "My Details", divider: divider, router: AppRouters.addressScreen,  ),
              AccountItem(icon: Icons.home_outlined, title: "Address Book", divider: divider , router: AppRouters.addressScreen,  ),
              AccountItem(icon: Icons.help_outline, title: "FAQs", divider: divider, router: AppRouters.addressScreen,   ),
              AccountItem(icon: Icons.headset_mic_outlined, title: "Help Center", divider:divider3 , router: AppRouters.addressScreen,  ),
              SizedBox(height: 64.h,),
              Padding(
                padding:  EdgeInsets.only(left: 24.w),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: AppColors.redColor,size: 24.sp,),
                    SizedBox(width: 6.w,),
                    InkWell(
                      child: Text("Logout", style: Appstyles.black16w500.copyWith(color: AppColors.redColor),),
                    ),
                    
                  ],
                ),
                
              ),
              SizedBox(height: 30.h,)
          
            ],
          ),
        ),
      ),
    );
  }
}