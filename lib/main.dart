import 'package:flutter/material.dart';
import 'package:movies_series_flutter/core/inject/inject.dart';
import 'package:movies_series_flutter/features/movie/presentation/ui/pages/home_page.dart';

void main() {
  Inject.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
