import 'package:books_sample/models/response/base_response_model.dart';
import 'package:books_sample/services/network/api.dart';

abstract class Repository {
  Future<ApiResponse<BaseResponse>> getBooks();
}
