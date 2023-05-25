import 'package:books_sample/models/response/base_response_model.dart';
import 'package:books_sample/services/api_response.dart';
import 'package:books_sample/services/network/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'books/books_repo_test.mocks.dart';

Future<void> main() async {
  late MockBooksRepoTest booksRepo;
  setUpAll(() {
    booksRepo = MockBooksRepoTest();
  });
  test('test getBooks', () async {
    final model = ApiResponse<BaseResponse>();
    when(booksRepo.getBooks()).thenAnswer((_) async {
      return model;
    });
    final res = await booksRepo.getBooks();
    expect(res, isA<ApiResponse<BaseResponse>>());
    expect(res, model);
  });
  test('test getBooks throws Exception', () {
    when(booksRepo.getBooks()).thenAnswer((_) async {
      throw Exception();
    });
    final res = booksRepo.getBooks();
    expect(res, throwsException);
  });
}
