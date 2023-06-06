import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerException extends Failure {
  ServerException(super.errorMessage);

  factory ServerException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerException('Connection time out with api server');
      case DioErrorType.sendTimeout:
        return ServerException('Send time out with api server');

      case DioErrorType.receiveTimeout:
        return ServerException('Receive time out with api server');
      case DioErrorType.badResponse:
        return ServerException.fromResponse(dioError.response!.statusCode!, dioError.response!.data!);
      case DioErrorType.cancel:
        return ServerException('Connection Canceled with api server');

      case DioErrorType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServerException('No Internet Connection');
        }
        return ServerException('Unexpected error');
      default: return ServerException('Opps please try again later');
    }

  }

  factory ServerException.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerException(
          response['error']['message']); //رد جي كده ده شكل الريسبونس
    } else if (statusCode == 404) {
      return ServerException('Your request not found');
    } else if (statusCode == 500) {
      return ServerException('Internal Server Error');
    } else {
      return ServerException('Opps please try again later');
    }
  }
}
