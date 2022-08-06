import 'package:flutter/material.dart';
import 'package:movies_series_flutter/models/movies_model.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
    );
  }
}
