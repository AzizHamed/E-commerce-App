import 'package:ecommerce_app/core/entities/Product.dart';
import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ItemDetailsScreen extends StatefulWidget {

  final Product product;
  const ItemDetailsScreen({super.key, required this.product});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 79.h,
          backgroundColor: AppColors.secondaryColor,
          leading: Padding(
            padding: EdgeInsets.only(top: 38.h, left: 10.w),
            child: IconButton(onPressed: ()=>GoRouter.of(context).pop(), icon: const Icon(Icons.arrow_back)),
          ),
          title: Padding(
            padding:  EdgeInsets.only(top: 40.h,),
            child: Text("Details", style: Appstyles.black24w600),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h,),
                Hero(
                   tag: "product/${widget.product.title}",
                  child: ClipRRect(
                     borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(widget.product.image,height: 369.h,width: 341.w, fit: BoxFit.fill)),
                ),
                  SizedBox(height: 12.h,),
                  Text(widget.product.title, style: Appstyles.black24w600,),
                  SizedBox(height:13.h ,),
                  Row(
                    children: [
                      Icon(Icons.star, size: 20.sp,color: Color(0xffFFA928),),
                      SizedBox(width: 5.w,),
                      Text("${widget.product.rating?.rate}/5", style: Appstyles.black16w500.copyWith(decoration: TextDecoration.underline),),
                      SizedBox(width: 5.w,),
                      Text("(${widget.product.rating?.count} reviews)", style: Appstyles.grey16w400.copyWith(color: Color(0xff808080)),)
                    ],
                  ),
                  SizedBox(height: 13.h,),
                  Text(widget.product.description, style: Appstyles.grey16w400.copyWith(color: Color(0xff808080)),),
                  SizedBox(height: 108.h,),
                  Divider(),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Price", style: Appstyles.black16w500.copyWith(color: AppColors.gray2Color),),
                          Text("\$ ${widget.product.price}", style: Appstyles.black24w600,)
                        ],

                      ),
                      ElevatedButton(onPressed: (){}, 
                      
                        
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        // fixedSize: Size(240.w, 54.h),
                        // padding: EdgeInsets.symmetric(horizontal: 84.w, vertical: 16.h),
                        fixedSize: Size(230.w, 54.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10.r),
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined, color: AppColors.secondaryColor,size: 24.sp,),
                          SizedBox(width: 3.w,),
                          Text("Add to Cart", style: Appstyles.black16w500.copyWith(color: AppColors.secondaryColor),)
                        ],
                      ),
                      )
                    ],
                  ),

                  SizedBox(height: 51.h,),
            
            
              ],
            ),
          ),
        ),
      )
      
       );
  }
}