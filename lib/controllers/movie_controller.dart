import 'package:flutter/material.dart';
import 'package:movies_series_flutter/models/movies_model.dart';
import 'package:movies_series_flutter/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;

  MovieController(this._moviesRepository) {
    fetch();
  }

  late ValueNotifier<Movies> movies;

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}