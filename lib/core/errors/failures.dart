import 'package:dio/dio.dart';

abstract class Failures {
  final String? errMessage;

  const Failures(this.errMessage);
}


class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioErorr(DioException dioExeption){
    switch(dioExeption.type) {
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
       return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
      return ServerFailure.fromResponse(dioExeption.response!.statusCode!,dioExeption.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.unknown:
      if(dioExeption.message!.contains('SocketException')){
        return ServerFailure('No Internet Connection');
      } else {
        return ServerFailure('Unknown Error');
      }
       }

  } 

  factory ServerFailure.fromResponse(int statueCode,dynamic response){
    
    if(statueCode == 400 || statueCode == 401 || statueCode == 403){
      return ServerFailure('Authentication Failure'); 
    } else if(statueCode == 404){
      return ServerFailure('Your request not found, please try again later!');
    } else if(statueCode == 500){
      return ServerFailure('Internal server error');
    } else {
      return ServerFailure('Opps something went wrong');
    }

  }
}

