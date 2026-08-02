import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dartz/dartz.dart' as either;
import 'package:ecommerce_app/core/entities/Eye.dart';
import 'package:ecommerce_app/core/entities/Token.dart';
import 'package:ecommerce_app/core/router/AppRouters.dart';
import 'package:ecommerce_app/core/service_locator/AppDependencies.dart';
import 'package:ecommerce_app/core/services/LoginScreenService.dart';
import 'package:ecommerce_app/core/storage/AppStorage.dart';
import 'package:ecommerce_app/features/authentication/provider/AuthBlock.dart';
import 'package:ecommerce_app/features/authentication/provider/AuthStates.dart';
import 'package:ecommerce_app/features/authentication/widgets/AppTextInput.dart';
import 'package:ecommerce_app/widgets/BottomText.dart';
import 'package:ecommerce_app/widgets/MyButton.dart';
import 'package:ecommerce_app/widgets/Subtitle.dart';
import 'package:ecommerce_app/widgets/Title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
   sl<AppStorage>().getToken().then((value){
    if(value!=null && value.isNotEmpty){
      context.pushReplacementNamed(AppRouters.mainScreen);
    }
   });
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    log("build in loginscreen");
    return SafeArea(
      child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 59.h),
              TitleWidget(title: "Login to your account"),
              SizedBox(height: 8.h,),
              Subtitle(subtitle: "It’s great to see you again."),
              SizedBox(height: 24.h,),
              AppTextInput(controller: usernameController, upperText: "User Name", text: "Enter your email address"),
              SizedBox(height: 16.h,),
              BlocSelector<Authblock,AuthStates,Eye>(
                selector: (state) => state.loginEye,
                builder: (context,state)=> AppTextInput(controller:passwordController, upperText: "Password", text: "Enter your password",isPassword: state == Eye.visibleEyeOff ? true : false, icon: state == Eye.visibleEyeOff ? InkWell(
                  onTap: () => context.read<Authblock>().changeLoginEye(),
                  child: Icon(Icons.visibility_off)) : InkWell(
                    onTap: () =>  context.read<Authblock>().changeLoginEye() ,
                    child: Icon(Icons.visibility)),)),
          
                SizedBox(height: 55.h,),
                MyButton(text: "Sign In", onPressed: (){
                  
                  context.read<Authblock>().showCircularIndicator();
//                   context.read<AppBloc>().login(User(
//   id: 1,
//   email: "johndoe@gmail.com",
//   username: "johnd",
//   password: "m38rmF\$",
  
//   name: Name(
//     firstname: "John",
//     lastname: "Doe",
//   ),

//   address: Address(
//     city: "kilcoole",
//     street: "new road",
//     number: 7682,

//     zipcode: "12926-3874",

//     geolocation: Geolocation(
//       lat: "-37.3159",
//       long: "81.1496",
//     ),
//   ),

//   phone: "1-570-236-7033",
//   v: 2
// ));

                  
                  sl<LoginScreenService>().login({
                    "username" : usernameController.text.trim(),
                    "password" : passwordController.text.trim()
                  }).then((either.Either<String,Token> res){
                    
                    res.fold((error){
                       context.read<Authblock>().removeCircularIndicator();
                        AnimatedSnackBar.material(error.toString(), 
                  type: AnimatedSnackBarType.error,
                  duration: const Duration(seconds: 5),
                  mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                  mobilePositionSettings: const MobilePositionSettings(
                    bottomOnAppearance: 80
                  ) 
                  ).show(context);
                    }, (right){
                       context.read<Authblock>().removeCircularIndicator();
                      sl<AppStorage>().saveToken(right.token);
                      GoRouter.of(context).pushReplacementNamed(AppRouters.mainScreen);
                      // context.read<AppBloc>().login()
                      
                    });
                  });
                  // GoRouter.of(context).pushReplacementNamed(AppRouters.mainScreen);

                 


                }),
          
          
                SizedBox(height: 20.h,),
          
                BlocSelector<Authblock, AuthStates,bool>(
                  selector: (state) => state.isLoading 
                  , builder: (context,state)=> state == true ? CircularProgressIndicator() : SizedBox.shrink()),

                  SizedBox(height: 260.h,),
                  BottomText(firstText: "Don’t have an account?", secondText: "Join", method: ()=> GoRouter.of(context).pushReplacementNamed(AppRouters.signupScreen))
            ],
          ),
        ),
      ),
    ));
  }
}