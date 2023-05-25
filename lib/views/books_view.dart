import 'dart:math';

import 'package:books_sample/viewmodels/book_details_view_model.dart';
import 'package:books_sample/viewmodels/books_view_model.dart';
import 'package:books_sample/views/books_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/error_widget.dart';

final booksViewFutureProvider =
    FutureProvider((ref) async => ref.watch(booksViewModelProvider).getBooks());

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final books = ref.watch(booksViewFutureProvider);
      return Scaffold(
          appBar: AppBar(
            title: const Text('BooksSample'),
          ),
          body: RefreshIndicator(
            onRefresh: () => ref.read(booksViewModelProvider).getBooks(),
            child: books.when(
                data: (result) => ListView.separated(
                    separatorBuilder: (_, index) => Container(
                          color: Colors.black12,
                          height: 3,
                        ),
                    itemBuilder: (_, index) {
                      final book = result?.results[index];
                      return Hero(
                          tag: book?.id ?? '',
                          child: ListTile(
                            onTap: () {
                              ref
                                  .read(bookDetailsViewModelProvider.notifier)
                                  .setBook(book: book);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const BookDetailsView()));
                            },
                            title: Text('${book?.title}'),
                            subtitle: Text('${book?.authors[0].name}'),
                            leading: const Icon(Icons.book),
                            trailing: Text(
                              'Downloads\n${book?.downloadCount}',
                              textAlign: TextAlign.center,
                            ),
                            tileColor: Color(
                                    (Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(0.3),
                          ));
                    },
                    itemCount: result?.results.length ?? 0),
                error: (error, trace) => BooksErrorWidget(
                    onTap: () => ref.refresh(booksViewFutureProvider)),
                loading: () =>
                    const Center(child: CircularProgressIndicator())),
          ));
    });
  }
}
