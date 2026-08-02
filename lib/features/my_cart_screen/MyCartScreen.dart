import 'package:ecommerce_app/core/entities/Cart.dart';
import 'package:ecommerce_app/core/entities/User.dart';
import 'package:ecommerce_app/core/service_locator/AppDependencies.dart';
import 'package:ecommerce_app/core/services/MycartScreenService.dart';
import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenBloc.dart';
import 'package:ecommerce_app/features/main_screen/provider/MainScreenBloc.dart';
import 'package:ecommerce_app/features/my_cart_screen/provider/MyCartScreenBloc.dart';
import 'package:ecommerce_app/features/my_cart_screen/provider/MyCartStates.dart';
import 'package:ecommerce_app/features/my_cart_screen/widgets/CartItem.dart';
import 'package:ecommerce_app/features/my_cart_screen/widgets/KeyValueRow.dart';
import 'package:ecommerce_app/features/provider/AppBloc.dart';
import 'package:ecommerce_app/features/provider/AppStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartScreen extends StatefulWidget {
  
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();

  
}
  

class _MyCartScreenState extends State<MyCartScreen> {
  double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: AppColors.secondaryColor,
          leading: Padding(
            padding:  EdgeInsets.only( left: 24.h),
            child: IconButton(onPressed: ()=>context.read<MainScreenBloc>().selectBottomBarItem(0), icon: Icon(Icons.arrow_back)),
          ),

          title: Text("My Cart", style: Appstyles.black24w600,),

          centerTitle: true,
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocSelector<AppBloc,AppStates,User?>(
            selector: (state) => state.signedInUser,
            builder: (context, state) {
              if(state == null){
                return Center(child: Text("No User"));
              }
              return FutureBuilder(future: sl<Mycartscreenservice>().getCart(state.id!), 
              builder: (context,snapshot){

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Builder(builder: (_){
                  
                        if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  
                  final data = snapshot.data as Cart ;
                  
                  if(data.products.isEmpty){
                    return Center(child: Text("No data found"),);
                  }
                  
                  final homeState = context.watch<Homescreenbloc>().state;
                  
                  
                  return SizedBox(
                    height: 220.h,
                    child: ListView.builder(
                      itemCount: data.products.length,
                      
                      itemBuilder: (context,index){
                        final cartProduct = data.products[index];
                    
                        final product = homeState.products.firstWhere((product)=>product.id == cartProduct.productId);

                        context.read<Mycartscreenbloc>().addToTotalPrice(product.price * (cartProduct.quantity));
                        return CartItem(cartProduct: cartProduct, product: product);
                      }
                      
                       ),
                  );
                  
                  
                  
                  
                      }),
                  
                      SizedBox(height: 145.h,),
                      BlocSelector<Mycartscreenbloc,Mycartstates,double>(
                        selector: (state) => state.totalPrice,

                        builder: (context,state)=> Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                KeyValueRow(key1: "Sub-total", value: "\$ $state"),
                                KeyValueRow(key1: "VAT (%)", value: "\$ 0.00"),
                                KeyValueRow(key1: "Shipping fee", value: "\$ 80"),
                              ],
                            ),
                             Divider(color: AppColors.gray2Color,),
                          SizedBox(height: 16.h,),
                          KeyValueRow(key1: "Total", value: "\$ $state"),
                          ],
                        ),
                      ),
                     
                      SizedBox(height: 51.h,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(341.w, 54.h),
                          backgroundColor: AppColors.primaryColor,
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10.r),
                          )
                        ),
                        onPressed: (){}, child: 
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Go To Checkout", style: Appstyles.black16w500.copyWith(color: AppColors.secondaryColor),),
                          SizedBox(width: 10.w,),
                          Icon(Icons.arrow_forward, color: AppColors.secondaryColor, size: 24.sp,)
                        ],
                      )),
                      SizedBox(height: 15.h,)
                    ],
                  ),
                );
                
                
               }              
              );
                },
          ),
           ),
      )
      
       );
  }
}