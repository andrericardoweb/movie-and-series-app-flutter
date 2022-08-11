import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_series_flutter/controllers/movie_controller.dart';
import 'package:movies_series_flutter/decorators/movies_cache_repository_decorator.dart';
import 'package:movies_series_flutter/models/movies_model.dart';
import 'package:movies_series_flutter/repositories/movies_repository_imp.dart';
import 'package:movies_series_flutter/service/dio_service_imp.dart';
import 'package:movies_series_flutter/widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImp(
        DioServiceImp(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              ValueListenableBuilder<Movies?>(
                  valueListenable: _controller.movies,
                  builder: (__, movies, _) {
                    return Visibility(
                      visible: movies != null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Movies',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            onChanged: _controller.onChanged,
                            autofocus: false,
                            style: const TextStyle(color: Colors.white70),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.black26,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              hintText: 'Search',
                              suffixIcon: Icon(
                                Icons.search_outlined,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  }),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.listMovies[idx]),
                          separatorBuilder: (_, __) => const Divider(),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
