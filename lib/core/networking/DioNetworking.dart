import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/ApiEndpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Dionetworking {

   Dio? _dio;


    Dionetworking(){
    _dio = initDio();
   }

   Dio initDio(){
    if(_dio==null){
      _dio =  Dio(BaseOptions(baseUrl: Apiendpoints.basedUrl , receiveDataWhenStatusError: true))..interceptors.add(PrettyDioLogger(
  ));
    }

    return _dio!;
  }

   getRequest(String endpoint)async{
    try{
      Response response = await _dio!.get(endpoint);
      return response;
    }on DioException{
      
      rethrow;
    }
  }


  Future<Response> postRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      Response response = await _dio!.post(
        endpoint,
        data: body,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }
  
}