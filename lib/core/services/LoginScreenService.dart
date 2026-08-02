import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/entities/Token.dart';
import 'package:ecommerce_app/core/networking/ApiEndpoints.dart';
import 'package:ecommerce_app/core/networking/DioNetworking.dart';
import 'package:ecommerce_app/core/service_locator/AppDependencies.dart';
import 'package:ecommerce_app/core/storage/AppStorage.dart';

class LoginScreenService {

  final Dionetworking _dio;

  const LoginScreenService(this._dio);

  Future<Either<String,Token>> login(
    Map<String, dynamic> body,
  ) async {
    Response res;
    try{

         res =
          await _dio.postRequest(
        Apiendpoints.login,
        body,
      );

      if(res.statusCode ==200 || res.statusCode == 201){

          await sl<AppStorage>().saveToken(res.toString());

          return Right(Token.fromJson(res.data));
      }

      else{
        return Left(res.toString());
      }
      
     

    }catch(error){
      return Left("username or password is incorrect");
    }
     
  
}
 
  

}