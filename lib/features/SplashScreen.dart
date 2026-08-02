import 'package:ecommerce_app/core/router/AppRouters.dart';
import 'package:ecommerce_app/core/service_locator/AppDependencies.dart';
import 'package:ecommerce_app/core/storage/AppStorage.dart';
import 'package:ecommerce_app/core/styles/AppAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();


 
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {

   late AnimationController controller;
  late Animation<double> animation;



  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1 , microseconds: 500))..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    // controller.forward(); 
    wait3Seconds();
    super.initState();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
    
  }

  void wait3Seconds()async{
    await Future.delayed(Duration(seconds: 3));
    String? token = await  sl<AppStorage>().getToken();
    if(token!=null && token.isNotEmpty){
      context.pushReplacementNamed(AppRouters.mainScreen);
    }
    else{
    context.pushReplacementNamed(AppRouters.loginScreen);

    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(Appassets.logo, height: 200.h,width: 200.w,)),),
    ));
  }
}