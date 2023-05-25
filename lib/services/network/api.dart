import 'package:books_sample/models/response/base_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio) = _Api;

  @GET('/books')
  Future<BaseResponse> getBooks();
}
