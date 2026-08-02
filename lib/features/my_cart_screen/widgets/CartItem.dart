import 'package:ecommerce_app/core/entities/CartProduct.dart';
import 'package:ecommerce_app/core/entities/Product.dart';
import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/core/styles/AppStyles.dart';
import 'package:ecommerce_app/features/my_cart_screen/widgets/ItemQuantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {

  final CartProduct cartProduct;
  final Product product;

  const CartItem({
    super.key,
    required this.cartProduct,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.only(
        bottom: 16.h,
      ),

      height: 107.h,

      decoration: BoxDecoration(

        borderRadius:
            BorderRadius.circular(10.r),

        border: Border.all(
          color: const Color(0xffE6E6E6),
          width: 1,
        ),
      ),

      child: Padding(

        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),

        child: Row(

          children: [

            ClipRRect(

              borderRadius:
                  BorderRadius.circular(4.r),

              child: Image.network(

                product.image,

                height: 79.h,
                width: 83.w,

                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Row(

                    children: [

                      Expanded(

                        child: Text(

                          product.title,

                          style:
                              Appstyles.black16w500,

                          maxLines: 1,

                          overflow:
                              TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(width: 8.w),

                      Icon(
                        Icons.delete_outline,

                        color:
                            AppColors.redColor,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                      
                        "\$${product.price}",
                      
                        style:
                            Appstyles.black16w500,
                      ),

                     ItemQuantity(quantity: cartProduct.quantity, productPrice: product.price,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}