import 'package:books_sample/models/response/base_response_model.dart';
import 'package:books_sample/services/network/api.dart';
import 'package:books_sample/services/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network/dio_factory.dart';
import 'network/error_handler.dart';
import 'network/network_info.dart';

final serviceProvider =
    Provider((ref) => RepositoryImpl(Api(DioFactory().getClientDio())));

class RepositoryImpl implements Repository {
  final Api _api;

  RepositoryImpl(this._api);

  @override
  Future<ApiResponse<BaseResponse>> getBooks() async {
    final networkInfo = NetworkInfoImpl(InternetConnectionChecker());
    if (await networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response = await _api.getBooks();
        return ApiResponse<BaseResponse>(response: response);
      } catch (error) {
        return (ApiResponse(error: ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return ApiResponse(error: DataSource.noInternetConnection.getFailure());
    }
  }
}
