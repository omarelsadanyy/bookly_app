import 'package:dio/dio.dart';

class ApiService 
{
  final _base_Url ='https://www.googleapis.com/books/v1/';
  final Dio _dio;
  final String _apiKey = 'AIzaSyBqQJZtloYf0lJZzoYqyrJBQCMBTW9Fltw';
  
  ApiService(this._dio);

  Future<Map<String,dynamic>> get({required String endPoint}) async
  {
     var response =await _dio.get('$_base_Url$endPoint&key=$_apiKey');

     return response.data;
  }
}