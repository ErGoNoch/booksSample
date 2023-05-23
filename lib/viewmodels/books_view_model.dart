import 'package:books_sample/models/book/book_model.dart';
import 'package:books_sample/services/repository_impl.dart';
import 'package:books_sample/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksViewModelProvider = Provider((ref) => BooksViewModel(ref));

class BooksViewModel {
  final Ref ref;

  BooksViewModel(this.ref);

  Future<List<Book>?> getBooks() async {
    var response = await ref.read(serviceProvider).getBooks();
    if (response.isSuccess()) {
      return response.response?.results;
    } else {
      showDialogFlash(
          title: 'Error', content: response.error?.message ?? 'General error');
      return [];
    }
  }
}
