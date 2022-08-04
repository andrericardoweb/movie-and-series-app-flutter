import 'package:flutter/material.dart';
import 'package:movies_series_flutter/controllers/movie_controller.dart';
import 'package:movies_series_flutter/repositories/movies_repository_imp.dart';
import 'package:movies_series_flutter/service/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
