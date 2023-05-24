import 'package:books_sample/models/book/book_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookDetailsViewModelProvider =
    StateNotifierProvider<BookDetailsViewModel, Book?>(
        (ref) => BookDetailsViewModel());

class BookDetailsViewModel extends StateNotifier<Book?> {
  BookDetailsViewModel() : super(null);

  void setBook({required Book? book}) async {
    state = book;
  }

  Book? getBook() {
    return state;
  }
}
