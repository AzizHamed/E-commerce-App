import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/features/account_screen/AccountScreen.dart';
import 'package:ecommerce_app/features/home_screen/HomeScreen.dart';
import 'package:ecommerce_app/features/main_screen/provider/MainScreenBloc.dart';
import 'package:ecommerce_app/features/main_screen/provider/MainScreenState.dart';
import 'package:ecommerce_app/features/my_cart_screen/MyCartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {

    List<Widget> ls = [HomeScreen(),MyCartScreen(),AccountScreen()];
    return SafeArea(
      
      child:
      
      BlocSelector<MainScreenBloc,MainScreenState,int>(
        selector: (state) => state.indx,
        builder: (context,state)=> Scaffold(
          bottomNavigationBar: Container(
            height: 86.h,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xffE6E6E6),
                  width: 1
                )
              )
            ),
            child: BottomNavigationBar(
              currentIndex: state,
              backgroundColor: Colors.white,
              selectedItemColor: AppColors.primaryColor,
              iconSize: 24.sp,
              type: BottomNavigationBarType.fixed,
              onTap: (value) => context.read<MainScreenBloc>().selectBottomBarItem(value),
              
            
              items: [
                BottomNavigationBarItem(
                  icon:  Icon(Icons.home),
                  label: "Home"
                
                ), 
                BottomNavigationBarItem(
                  
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: "Cart"
                   ),
                BottomNavigationBarItem(
                  
                  icon: Icon(Icons.person_outline),
                  label: "Account"
                   )
                
                ]
              
               ),
          ),
          body: ls[state]
        ),
      ) );
  }
}