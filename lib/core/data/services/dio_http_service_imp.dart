import 'package:dio/dio.dart';
import 'package:movies_series_flutter/core/domain/services/http_service.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;
  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDU0ZjgwYmViMGRiN2RkZjJlZWMzNmIyNWZmMGNiZiIsInN1YiI6IjYyYTQwMTVkZDZkNjRkMDA5ZGY2OThjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ab42K9qYPE7Dgck4eHGwn2M40H59gIGsikdUZVC6V78'
        },
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}
