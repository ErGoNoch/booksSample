import 'package:books_sample/main.dart';
import 'package:books_sample/views/books_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders the main Page', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BooksView), findsOneWidget);
    });
  });
}
