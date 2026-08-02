import 'package:ecommerce_app/core/entities/Eye.dart';
import 'package:ecommerce_app/core/router/AppRouters.dart';
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

class SignupScrenn extends StatefulWidget {
  const SignupScrenn({super.key});

  @override
  State<SignupScrenn> createState() => _SignupScrennState();
}

class _SignupScrennState extends State<SignupScrenn> {
  late TextEditingController fullnameController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;


  @override
  void initState() {
    fullnameController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullnameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 59.h,),
                TitleWidget(title: "Create an account"),
                SizedBox(height: 8.h,),
                Subtitle(subtitle: "Let’s create your account."),
                SizedBox(height: 24.h,),
                AppTextInput(controller: fullnameController, text: "Enter your full name", upperText: "Full Name",),
                SizedBox(height: 16.h,),
                AppTextInput(controller: usernameController, text: "Enter your email address", upperText: "User Name",),
                SizedBox(height: 16.h,),
                BlocSelector<Authblock,AuthStates,Eye>(
                  selector: (state) => state.signupEye,
            
                  builder :(context,state)=> Column(
                    children: [
                  AppTextInput(controller: passwordController, text: "Enter your password",upperText: "Password", isPassword: state == Eye.visibleEye ? false : true, icon: state == Eye.visibleEye ? InkWell(
                    onTap: () => context.read<Authblock>().changeSignupEye(),
                    child: InkWell(
                       onTap: () => context.read<Authblock>().changeSignupEye(),
                      child: Icon(Icons.visibility))) : InkWell(
                         onTap: () => context.read<Authblock>().changeSignupEye(),
                        child: Icon(Icons.visibility_off)),),
                    SizedBox(height: 16.h,),
                  AppTextInput(controller: confirmPasswordController, text: "Enter your password",upperText: "Confirm Password", isPassword: state == Eye.visibleEye ? false : true, icon: state == Eye.visibleEye ? InkWell(
                    onTap: () => context.read<Authblock>().changeSignupEye(),
                    child: Icon(Icons.visibility)) : InkWell(
                       onTap: () => context.read<Authblock>().changeSignupEye(),
                      child: Icon(Icons.visibility_off)),)
                    ],
                  ),
                ),
                SizedBox(height: 42.h,),
                MyButton(text: "Create Account", onPressed: (){
                  context.read<Authblock>().showCircularIndicator();
                }),
                  SizedBox(height: 20.h,),
          
                BlocSelector<Authblock, AuthStates,bool>(
                  selector: (state) => state.isLoading 
                  , builder: (context,state)=> state == true ? CircularProgressIndicator() : SizedBox.shrink()),
                  SizedBox(height:  75.h,),
                  BottomText(firstText: "Already have an account?", secondText: "Log In", method: (){
                    GoRouter.of(context).pushReplacementNamed(AppRouters.loginScreen);
                  })
            
                 
              ],
            ),
          ),
        ),
      ) );
  }
}