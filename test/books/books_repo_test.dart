import 'package:books_sample/models/response/base_response_model.dart';
import 'package:books_sample/services/network/api.dart';
import 'package:books_sample/services/network/dio_factory.dart';
import 'package:books_sample/services/repository.dart';
import 'package:books_sample/services/repository_impl.dart';
import 'package:books_sample/viewmodels/books_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'books_repo_test.mocks.dart';

class BooksRepoTest extends Mock implements Repository {}

@GenerateMocks([BooksRepoTest])
Future<void> main() async {
  late MockBooksRepoTest booksRepo;

  setUpAll(() {
    booksRepo = MockBooksRepoTest();
    // viewModel = BooksViewModel(booksRepo);
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
  test('BooksViewModel Test', () async {
    final container = ProviderContainer(
      overrides: [
        booksViewModelProvider.overrideWithValue(
            BooksViewModel(RepositoryImpl(Api(DioFactory().getClientDio()))))
      ],
    );
    final viewModel = container.read(booksViewModelProvider);
    await expectLater(viewModel.getBooks(), completion(isNotNull));
  });
}
