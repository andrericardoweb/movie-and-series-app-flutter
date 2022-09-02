import 'package:movies_series_flutter/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movies_series_flutter/features/movie/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_series_flutter/features/movie/domain/repositories/get_movies_repository.dart';

class GetMoviesRepositoryImp implements GetMoviesRepository {
  final GetMoviesDataSource _getMoviesDataSource;
  GetMoviesRepositoryImp(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await _getMoviesDataSource();
  }
}