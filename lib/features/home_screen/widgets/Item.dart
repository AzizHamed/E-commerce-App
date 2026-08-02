import 'package:ecommerce_app/core/entities/Product.dart';
import 'package:ecommerce_app/core/router/AppRouters.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ItemWidget extends StatelessWidget {
  final Product product;
  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).pushNamed(AppRouters.productDetailsScreen, extra: product),
      child: SizedBox(
        width: 161.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "product/${product.title}",
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10.r),
                child: Image.network(product.image, height: 174.h, width: 161.w, fit: BoxFit.fill,),
              ),
            ),
            SizedBox(height: 8.h,),
            Text(product.title, style: Appstyles.black16w500, maxLines: 1, overflow: TextOverflow.ellipsis,),
            SizedBox(height: 3.h,),
            Text("\$ ${product.price.toString()}", style: Appstyles.grey12w500.copyWith(color: Color(0xff808080), fontSize: 14.sp)),
          ],
        ),
      ),
    );
    
  }
}