import 'package:books_sample/utils/utils.dart';
import 'package:books_sample/views/books_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config_reader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'BooksSample',
        navigatorKey: navigatorKey,
        theme: ThemeData.light(),
        home: const SafeArea(child: BooksView()),
      ),
    );
  }
}
