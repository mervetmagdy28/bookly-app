import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromResponse(int statusCode, dynamic response){
    if(statusCode==400|| statusCode==401 || statusCode==403) {
      return ServerFailure(response['errors']['message']);
    }else if(statusCode==404){
      return ServerFailure("server not found, try again later");
    }else if(statusCode==500){
      return ServerFailure("there is a problem in server, try again later");
    }else{
      return ServerFailure("oops there is an problem, try again later");
    }
  }
  factory ServerFailure.fromDioError({required DioError dioError}){

    switch (dioError.type){
      case DioErrorType.connectionTimeout:
        return ServerFailure("Connection Timeout with ApiServer");
      case DioErrorType.sendTimeout:
        return ServerFailure("Send Timeout with ApiServer");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Receive Timeout with ApiServer");
      case DioErrorType.badCertificate:
        return ServerFailure("Bad Certificate Timeout with ApiServer");
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure("Request with ApiServer was Canceled");
      case DioErrorType.connectionError:
        return ServerFailure("there is a Connection problem");
      case DioErrorType.unknown:
        if(dioError.message!.contains("SocketException")){
          return ServerFailure("there is a Connection problem");
        }return ServerFailure("Unexpected Error ,please try again later");
      default:
        return ServerFailure("Oops there is an problem, try again later");

    }
  }

}
