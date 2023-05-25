import 'package:books_sample/models/book/book_model.dart';
import 'package:books_sample/models/response/base_response_model.dart';
import 'package:books_sample/services/network/api.dart';
import 'package:books_sample/services/repository.dart';
import 'package:books_sample/services/repository_impl.dart';
import 'package:books_sample/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/network/dio_factory.dart';

final booksViewModelProvider = Provider(
    (ref) => BooksViewModel(RepositoryImpl(Api(DioFactory().getClientDio()))));

class BooksViewModel {
  final Repository repository;

  //
  BooksViewModel(this.repository);

  Future<BaseResponse?> getBooks() async {
    var response = await repository.getBooks();
    if (response.isSuccess()) {
      return response.response;
    } else {
      showDialogFlash(
          title: 'Error', content: response.error?.message ?? 'General error');
      return null;
    }
  }
}
