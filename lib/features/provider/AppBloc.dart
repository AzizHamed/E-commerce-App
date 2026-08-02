import 'package:ecommerce_app/core/entities/Address.dart';
import 'package:ecommerce_app/core/entities/GeoLocation.dart';
import 'package:ecommerce_app/core/entities/Name.dart';
import 'package:ecommerce_app/core/entities/User.dart';
import 'package:ecommerce_app/features/provider/AppStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppStates>{
  AppBloc() : super(AppStates(User(
  id: 1,
  email: "johndoe@gmail.com",
  username: "johnd",
  password: "m38rmF\$",
  
  name: Name(
    firstname: "John",
    lastname: "Doe",
  ),

  address: Address(
    city: "kilcoole",
    street: "new road",
    number: 7682,

    zipcode: "12926-3874",

    geolocation: Geolocation(
      lat: "-37.3159",
      long: "81.1496",
    ),
  ),

  phone: "1-570-236-7033",
  v: 2
)));

  void login(User user){
    emit(AppStates(user));
  }

  void logout(User user){
    emit(AppStates(null));
  }

}