import 'package:dio/dio.dart';
import 'package:movies_series_flutter/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      //Update
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization' : 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDU0ZjgwYmViMGRiN2RkZjJlZWMzNmIyNWZmMGNiZiIsInN1YiI6IjYyYTQwMTVkZDZkNjRkMDA5ZGY2OThjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ab42K9qYPE7Dgck4eHGwn2M40H59gIGsikdUZVC6V78'
        },
      ),
    );
  }

}