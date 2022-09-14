

import 'package:dio/dio.dart';

class CryptoService {

  Dio dio = Dio();

 String url;

  Future<Response> getApi() async{
    Response response = await dio.get(url);
    return response;
  }
}