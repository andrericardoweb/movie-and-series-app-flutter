import 'package:movies_series_flutter/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}