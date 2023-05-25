import 'package:books_sample/main.dart';
import 'package:books_sample/models/book/book_model.dart';
import 'package:books_sample/models/person/person_model.dart';
import 'package:books_sample/models/response/base_response_model.dart';
import 'package:books_sample/services/api_response.dart';
import 'package:books_sample/services/network/api.dart';
import 'package:books_sample/services/network/dio_factory.dart';
import 'package:books_sample/services/repository.dart';
import 'package:books_sample/services/repository_impl.dart';
import 'package:books_sample/viewmodels/books_view_model.dart';
import 'package:books_sample/views/books_details_view.dart';
import 'package:books_sample/views/books_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../helpers/helpers.dart';
import 'books_repo_test.mocks.dart';

class BooksRepoTest extends Mock implements Repository {}

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

final fakeResponse = BaseResponse(70746, "", "", [
  Book(
    1661,
    'The Adventures of Sherlock Holmes',
    'Text',
    15973,
    [
      "Detective and mystery stories",
      "English",
      "Holmes",
      "Sherlock (Fictitious character) -- Fiction",
      " Private investigators -- England -- Fiction"
    ],
    [
      "Banned Books from Anne Haight's list",
      "Contemporary Reviews, Detective Fiction"
    ],
    ["en"],
    false,
    [Person(1859, 1930, 'Doyle, Arthur Conan')],
    [],
  )
]);

@GenerateMocks([BooksRepoTest])
Future<void> main() async {
  late MockBooksRepoTest booksRepo;
  CustomBindings();

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

  testWidgets('renders the BooksView with data', (tester) async {
    await tester.pumpApp(
      const BooksView(),
      providerOverrides: [
        booksViewFutureProvider.overrideWith(
          (ref) => Future.value(fakeResponse),
        ),
      ],
    );
    await tester.pumpAndSettle();
    expect(find.byType(BooksView), findsOneWidget);
    expect(find.text('The Adventures of Sherlock Holmes'), findsOneWidget);
  });

  testWidgets('renders the HomePage and navigates to DetailsPage',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          booksViewFutureProvider.overrideWith(
            (ref) => Future.value(fakeResponse),
          ),
        ],
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('The Adventures of Sherlock Holmes'));
    await tester.pumpAndSettle();

    expect(find.byType(BookDetailsView), findsOneWidget);
  });
}
