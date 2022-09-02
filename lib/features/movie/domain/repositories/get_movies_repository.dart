import 'package:dartz/dartz.dart';
import 'package:movies_series_flutter/features/movie/domain/entities/movie_entity.dart';

abstract class GetMoviesRepository {
  Future<Either<Exception, MovieEntity>> call();
}
