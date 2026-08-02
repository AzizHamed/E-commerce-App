import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenBloc.dart';
import 'package:ecommerce_app/features/home_screen/widgets/CategoryContainer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {

  final String stateCategory;
  const Categories({super.key, required this.stateCategory});
  
  @override
  Widget build(BuildContext context) {



    Color decideColorOfCategory(String cat, String catSelected){
    if(cat == catSelected){
      return AppColors.primaryColor;
    }

    return AppColors.secondaryColor;
  }



    return   Row(
                                spacing: 8.w,
                              children: [
                                CategoryContainer(text: "electronics", method: (){
                                  context.read<Homescreenbloc>().getProductsBorder("electronics");
                                }, selectedbackgroundColor: decideColorOfCategory("electronics", stateCategory)),
                                CategoryContainer(text: "jewelery", method: (){
                                  context.read<Homescreenbloc>().getProductsBorder("jewelery");
                                }, selectedbackgroundColor: decideColorOfCategory("jewelery", stateCategory)),
                                CategoryContainer(text: "men's clothing", method: (){
                                  context.read<Homescreenbloc>().getProductsBorder("men's clothing");
                                }, selectedbackgroundColor: decideColorOfCategory("men's clothing", stateCategory)),
                                CategoryContainer(text: "women's clothing", method: (){
                                  context.read<Homescreenbloc>().getProductsBorder("women's clothing");
                                }, selectedbackgroundColor: decideColorOfCategory("women's clothing", stateCategory)),
                                                  
                                                
                              ],
                                                  );
  }

  

 
}
