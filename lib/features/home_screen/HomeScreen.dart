import 'package:ecommerce_app/core/styles/AppColors.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenBloc.dart';
import 'package:ecommerce_app/features/home_screen/widgets/HomeScreenGridView.dart';
import 'package:ecommerce_app/features/home_screen/widgets/UpperWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Color decideColorOfCategory(String cat, String catSelected){
    if(cat == catSelected){
      return AppColors.primaryColor;
    }

    return AppColors.secondaryColor;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperWidget(searchController: searchController, onFieldSubmitted: (_) {
                context.read<Homescreenbloc>().filterProducts(searchController.text);
              },),
              SizedBox(height: 16.h,),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.secondaryColor,
                  onRefresh: () =>  context.read<Homescreenbloc>().getAllProducts(),
                  child: HomeScreenGridView()),
              ),    
            ],
          ),
        ),
      )
       );
  }
}