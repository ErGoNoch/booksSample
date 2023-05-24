import 'package:books_sample/models/book/book_model.dart';
import 'package:books_sample/models/person/person_model.dart';
import 'package:books_sample/viewmodels/book_details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  late BookDetailsViewModel viewModel;

  setUpAll(() {
    viewModel = BookDetailsViewModel();
  });

  group('bookDetailsViewModel test', () {
    test('test getBook', () async {
      final model = Book(
        0,
        'title',
        'mediaType',
        10,
        [],
        [],
        [],
        false,
        [Person(1900, 1900, 'name')],
        [Person(1900, 1900, 'name')],
      );

      // final book = viewModel.getBook();
      viewModel.setBook(book: model);

      expect(viewModel.state, model);
    });
  });
}
