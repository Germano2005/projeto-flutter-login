import 'package:dio/dio.dart';

class JsonplaceholderCustonDio {

  final _dio = Dio();

  JsonplaceholderCustonDio(){
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }

  Dio get dio => _dio;
}