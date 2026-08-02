import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/entities/Cart.dart';
import 'package:ecommerce_app/core/networking/ApiEndpoints.dart';
import 'package:ecommerce_app/core/networking/DioNetworking.dart';

class Mycartscreenservice {
  final Dionetworking _dio;
  const Mycartscreenservice(this._dio);
   getCart(int userId)async{
    try{
      final Response res = await _dio.getRequest("${Apiendpoints.carts}/user/$userId");
      return Cart.fromJson((res.data as List)[0]);
    }catch(error){
      return Future.error(error);
    }
  }
}