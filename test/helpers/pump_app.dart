import 'package:books_sample/viewmodels/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class TestApp extends ConsumerWidget {
  const TestApp({required this.widget, super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize the CoreRepository
    ref.watch(booksViewModelProvider);

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      home: widget,
    );
  }
}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    List<Override> providerOverrides = const [],
  }) {
    return pumpWidget(
      ProviderScope(
        overrides: [
          ...providerOverrides,
        ],
        child: TestApp(widget: widget),
      ),
    );
  }
}
