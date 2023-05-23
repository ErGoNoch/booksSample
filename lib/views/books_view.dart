import 'dart:math';

import 'package:books_sample/viewmodels/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_widget.dart';

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
        body: books.when(
            data: (result) => ListView.separated(
                separatorBuilder: (_, index) => Container(
                      color: Colors.black12,
                      height: 3,
                    ),
                itemBuilder: (_, index) {
                  final book = result?[index];
                  return ListTile(
                    title: Text('${book?.title}'),
                    tileColor: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(0.3),
                  );
                },
                itemCount: result?.length ?? 0),
            error: (error, trace) => BooksErrorWidget(
                onTap: () => ref.refresh(booksViewFutureProvider)),
            loading: () => const CircularProgressIndicator()),
      );
    });
  }
}
