import 'package:books_sample/viewmodels/book_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, child) {
      final book = ref.read(bookDetailsViewModelProvider.notifier).getBook();
      return Scaffold(
          appBar: AppBar(
            title: Text('${book?.title}'),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Author ${book?.authors[0].name}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Downloads: ${book?.downloadCount}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Languages :${book?.languages}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Bookshelves :${book?.bookshelves}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.menu_book_sharp,
                color: Colors.blueAccent,
                size: 100,
              )
            ],
          )));
    });
  }
}
