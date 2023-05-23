import 'package:books_sample/models/response/base_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'failure.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('/books')
  Future<BaseResponse> getBooks();
}

class ApiResponse<T> {
  ApiResponse({this.response, this.error});

  final T? response;
  final Failure? error;

  bool isSuccess() => response != null;

  bool isFailure() => error != null;
}
