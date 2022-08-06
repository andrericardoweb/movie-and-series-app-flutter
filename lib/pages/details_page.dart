import 'package:flutter/material.dart';
import 'package:movies_series_flutter/models/movies_model.dart';
import 'package:movies_series_flutter/utils/apis.utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .55,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.title_outlined),
                    const SizedBox(width: 8),
                    Text(movie.originalTitle),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.new_releases_outlined),
                    const SizedBox(width: 8),
                    Text(movie.releaseDate),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
