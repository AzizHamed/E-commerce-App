

import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/features/my_cart_screen/provider/MyCartScreenBloc.dart';
import 'package:ecommerce_app/features/my_cart_screen/provider/MyCartStates.dart';
import 'package:ecommerce_app/features/my_cart_screen/widgets/Counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ItemQuantity extends StatefulWidget {
  final int quantity;
  final double productPrice;
  const ItemQuantity({super.key,required this.quantity, required this.productPrice});

  @override
  State<ItemQuantity> createState() => _ItemQuantityState();
}

class _ItemQuantityState extends State<ItemQuantity> {
    late int num;


  @override
  void initState() {
    super.initState();
    num = widget.quantity;
  }

  

  @override
  Widget build(BuildContext context) {
   
    return  Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                           CounterWidget(icon: Icon(Icons.remove), onPressed: () {
                            if(num > 0){
                              num--;
                              context.read<Mycartscreenbloc>().decrementFromTotalPrice(widget.productPrice);
                            }

                            
                           }),
                           SizedBox(width: 10.w,),
                           BlocSelector<Mycartscreenbloc,Mycartstates,double>(
                            selector: (state) => state.totalPrice,
                            builder:(context,state)=> Text(num.toString())),
                            SizedBox(width: 10.w,),
                            CounterWidget(icon: Icon(Icons.add ,size: 14.sp, color: AppColors.blackColor), onPressed: (){
                              num++;
                              context.read<Mycartscreenbloc>().addToTotalPrice(widget.productPrice);
                            }
                            
                            )
                        
                          ],
                        ),
                      );
  }
}