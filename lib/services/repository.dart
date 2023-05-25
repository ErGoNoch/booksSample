import 'package:books_sample/models/response/base_response_model.dart';

import 'api_response.dart';

abstract class Repository {
  Future<ApiResponse<BaseResponse>> getBooks();
}
