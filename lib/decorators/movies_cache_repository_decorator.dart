import 'dart:convert';

import 'package:movies_series_flutter/decorators/movies_repository_decorator.dart';
import 'package:movies_series_flutter/models/movies_model.dart';
import 'package:movies_series_flutter/repositories/movies_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesCacheRepositoryDecorator extends MoviesRepositoryDecorator {
  MoviesCacheRepositoryDecorator(MoviesRepository moviesRepository)
      : super(moviesRepository);

  @override
  // ignore: unnecessary_overrides
  Future<Movies> getMovies() async {
    try {
      Movies movies = await super.getMovies();
      _saveInCache(movies);
      return movies;
    } catch (e) {
      return await _getInCache();
    }
  }

  _saveInCache(Movies movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print('Salvou no cache: ${jsonMovies}');
  }

  Future<Movies> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = Movies.fromJson(json);
    print('Recuperou do cache: ${movies.toString()}');
    return movies;
  }
}
