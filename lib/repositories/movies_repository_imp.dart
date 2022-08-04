import 'package:movies_series_flutter/models/movies_model.dart';
import 'package:movies_series_flutter/repositories/movies_repository.dart';
import 'package:movies_series_flutter/service/dio_service.dart';
import 'package:movies_series_flutter/utils/apis.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);

  @override
  Future<Movies> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }

}