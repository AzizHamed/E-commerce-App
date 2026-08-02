import 'package:ecommerce_app/core/networking/DioNetworking.dart';
import 'package:ecommerce_app/core/services/AddressService.dart';
import 'package:ecommerce_app/core/services/HomeScreenService.dart';
import 'package:ecommerce_app/core/services/LoginScreenService.dart';
import 'package:ecommerce_app/core/services/MycartScreenService.dart';
import 'package:ecommerce_app/core/storage/AppStorage.dart';
import 'package:ecommerce_app/features/authentication/provider/AuthBlock.dart';
import 'package:ecommerce_app/features/home_screen/provider/HomeScreenBloc.dart';
import 'package:ecommerce_app/features/main_screen/provider/MainScreenBloc.dart';
import 'package:ecommerce_app/features/my_cart_screen/provider/MyCartScreenBloc.dart';
import 'package:ecommerce_app/features/provider/AppBloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUpServiceLocator(){
  final Dionetworking dio = Dionetworking();
  sl.registerSingleton<Dionetworking>(dio);

  sl.registerLazySingleton<Homescreenservice>(()=>Homescreenservice(sl()));
  sl.registerLazySingleton<LoginScreenService>(()=>LoginScreenService(sl()));
  sl.registerLazySingleton<Addressservice>(()=>Addressservice());
  sl.registerLazySingleton<Mycartscreenservice>(()=>Mycartscreenservice(sl<Dionetworking>()));
  sl.registerLazySingleton(()=>AppStorage());
  sl.registerFactory(()=>Homescreenbloc());
  sl.registerFactory(()=>Authblock());
  sl.registerFactory(()=>MainScreenBloc());
  sl.registerFactory(()=>Mycartscreenbloc());
  sl.registerFactory(()=>AppBloc());
 
}