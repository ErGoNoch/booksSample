import 'package:dio/dio.dart';

import '../../utils/constants.dart';
import 'failure.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultDataSource
}

class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultDataSource.getFailure();
    }
  }
  late Failure failure;

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ResponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ResponseCode.unauthorised:
            return DataSource.unauthorised.getFailure();
          case ResponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ResponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.defaultDataSource.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.unknown:
        return DataSource.defaultDataSource.getFailure();
      case DioErrorType.badCertificate:
        return DataSource.defaultDataSource.getFailure();
      case DioErrorType.connectionError:
        return DataSource.defaultDataSource.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return Failure(
          ResponseCode.connectTimeout,
          ResponseMessage.connectTimeout,
        );
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultDataSource:
        return Failure(
          ResponseCode.defaultResponseCode,
          ResponseMessage.defaultResponseMessage,
        );
      case DataSource.success:
        break;
      case DataSource.noContent:
        break;
    }
    return Failure(
      ResponseCode.defaultResponseCode,
      ResponseMessage.defaultResponseMessage,
    );
  }
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorised = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side

  // local status code
  static const int defaultResponseCode = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String success = Constants.success; // success with data
  static const String noContent =
      Constants.noContent; // success with no content
  static const String badRequest =
      Constants.badRequestError; // failure, api rejected our request
  static const String forbidden =
      Constants.forbiddenError; // failure,  api rejected our request
  static const String unauthorised =
      Constants.unauthorizedError; // failure, user is not authorised
  static const String notFound = Constants
      .notFoundError; // failure, API url not correct and not found in api side.
  static const String internalServerError =
      Constants.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String defaultResponseMessage =
      Constants.defaultError; // unknown error happened
  static const String connectTimeout =
      Constants.timeoutError; // issue in connectivity
  static const String cancel =
      Constants.defaultError; // API request was cancelled
  static const String receiveTimeout =
      Constants.timeoutError; //  issue in connectivity
  static const String sendTimeout =
      Constants.timeoutError; //  issue in connectivity
  static const String cacheError = Constants
      .defaultError; //  issue in getting data from local data source (cache)
  static const String noInternetConnection =
      Constants.noInternetError; // issue in connectivity
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
