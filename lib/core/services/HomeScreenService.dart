import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/entities/Product.dart';
import 'package:ecommerce_app/core/networking/ApiEndpoints.dart';
import 'package:ecommerce_app/core/networking/DioNetworking.dart';
import 'package:flutter/foundation.dart';

class Homescreenservice {

  final Dionetworking _dio;
  const Homescreenservice(this._dio);

   Future<List<Category>> getCategories()async{
    try{
    final Response res = await _dio.getRequest("${Apiendpoints.products}/${Apiendpoints.categories}");
    return res.data;
    }catch(error){
      return Future.error(error);
    }
  }
   Future<List<Product>> getCategoryProducts(String catg)async{
    try{

    final Response res = await _dio.getRequest("${Apiendpoints.products}/${Apiendpoints.categories}/$catg");
    List<Product> ls = (res.data as List).map((e)=>Product.fromJson(e)).toList();
    return ls;
    }catch(error){
      return Future.error(error);
    }
  }
   Future<List<Product>> getAllProducts()async{
    try{

    final Response res = await _dio.getRequest(Apiendpoints.products);
    List<Product> ls = (res.data as List).map((e)=>Product.fromJson(e)).toList();
    return ls;
    }catch(error){
      return Future.error(error);
    }
  }


}