import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenBloc.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenStates.dart';
import 'package:ecommerce_app/features/home_screen/widgets/Categories.dart';
import 'package:ecommerce_app/features/home_screen/widgets/Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenGridView  extends StatelessWidget {
  const HomeScreenGridView ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Homescreenbloc,Homescreenstates>(
      
      builder: (context,state){
        
        
        return Column(
          children: [
    
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Categories(stateCategory: state.categorySelected),
            ),
    
                              
                  SizedBox(height: 24.h,),
    
    Expanded(
    child:Builder(builder: (_){
      if(state is ErrorState){
         return Center(child: Text("error = ${state.error}")); }
         
         
          if(state.isLoading==true){ 
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: GridView.builder(
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    mainAxisSpacing: 20.h,
                    mainAxisExtent: 224.h
                        
                        ),
                  itemCount: 6,
              
               itemBuilder: (context, index)=>Container(
                 width: 161.w,
                 color: AppColors.primaryColor,
               ) 
               
               ),
            );
            
            
             } 
          
          
          if(state.products.isEmpty){
            
             return Center(child: Text("No data found"),); }
    
    return AnimationLimiter(

      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19.w,
          mainAxisSpacing: 20.h,
          mainAxisExtent: 300.h
          
          ),
          itemCount: state.products.length,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 600),
            child: SlideAnimation(
               verticalOffset: 300,
              child: FadeInAnimation(child: ItemWidget(product: state.products[index],))),
          ),
       ),
    );
    
    }
    
                        ),)
          ],
        );}
    );
  }
}