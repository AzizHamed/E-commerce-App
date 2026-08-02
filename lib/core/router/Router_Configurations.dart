import 'package:ecommerce_app/core/entities/Product.dart';
import 'package:ecommerce_app/core/router/AppRouters.dart';
import 'package:ecommerce_app/core/service_locator/AppDependencies.dart';
import 'package:ecommerce_app/features/SplashScreen.dart';
import 'package:ecommerce_app/features/address_screen/AddressScreen.dart';
import 'package:ecommerce_app/features/authentication/login_screen/LoginScreen.dart';
import 'package:ecommerce_app/features/authentication/provider/AuthBlock.dart';
import 'package:ecommerce_app/features/authentication/sign_up_screen/SignupScreen.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenBloc.dart';
import 'package:ecommerce_app/features/item_details_screen/ItemDetailsScreen.dart';
import 'package:ecommerce_app/features/main_screen/MainScreen.dart';
import 'package:ecommerce_app/features/main_screen/provider/MainScreenBloc.dart';
import 'package:ecommerce_app/features/my_cart_screen/provider/MyCartScreenBloc.dart';
import 'package:ecommerce_app/features/provider/AppBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

class RouterConfigurations {
  static final goRouter = GoRouter(
    initialLocation: AppRouters.splashScreen,
    routes: [
      GoRoute(
        path: AppRouters.loginScreen,
        name: AppRouters.loginScreen,
        
        builder:(context, state) => MultiBlocProvider(
          providers: [
           BlocProvider(
            create: (context) => sl<Authblock>()),

            BlocProvider(
              create: (context)=>sl<AppBloc>(),
              ),
              

          ],
          child: Loginscreen(),
        ),
        pageBuilder: GoTransitions.slide.toRight.withFade
        ),


      GoRoute(
        path: AppRouters.signupScreen,
        name: AppRouters.signupScreen,

       builder:(context, state) => MultiBlocProvider(
          providers: [
           BlocProvider(
            create: (context) => sl<Authblock>()),

            BlocProvider(
              create: (context)=>sl<AppBloc>(),
              ),
              

          ],
          child: SignupScrenn(),
          
        ),
                pageBuilder: GoTransitions.slide.toRight.withFade

        ),
      GoRoute(
        path: AppRouters.mainScreen,
        name: AppRouters.mainScreen,
        builder:(context, state) => MultiBlocProvider(
          providers: [BlocProvider(create: (context)=>MainScreenBloc()), BlocProvider(create: (context)=>sl<Homescreenbloc>()), BlocProvider(
            create: (context)=>sl<AppBloc>()
             ), BlocProvider(create: (context)=>sl<Mycartscreenbloc>())],
           child: Mainscreen()
           ),
                   pageBuilder: GoTransitions.slide.toRight.withFade

        ),
      GoRoute(
        path: AppRouters.productDetailsScreen,
        name: AppRouters.productDetailsScreen,
        builder:(context, state) => ItemDetailsScreen(product: state.extra as Product,),
        ),
      GoRoute(
        path: AppRouters.myCartScreen,
        name: AppRouters.myCartScreen,
        builder:(context, state) => Container(),
        ),
      GoRoute(
        path: AppRouters.addressScreen,
        name: AppRouters.addressScreen,
        builder:(context, state) => BlocProvider(
          create: (context) => sl<AppBloc>(),
          child: AddressScreen()),
                  pageBuilder: GoTransitions.slide.toRight.withFade

        ),
      GoRoute(
        path: AppRouters.accountScreen,
        name: AppRouters.accountScreen,
        builder:(context, state) => Container(),
                pageBuilder: GoTransitions.slide.toRight.withFade

        ),
        GoRoute(
        path: AppRouters.splashScreen,
        name: AppRouters.splashScreen,
        builder:(context, state) => SplashScreen(),
        ),

    ]
    );
}