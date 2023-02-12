import 'package:flutter/material.dart';
import 'package:studio_ghibli_studio/data/movie_model.dart';

import 'card_movie.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.listOfMovies});

  final List<MovieModel> listOfMovies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 10.0),
      itemCount: listOfMovies.length,
      itemBuilder: ((context, index) {
        final movie = listOfMovies[index];
        return CardMovie(name: movie.name, image: movie.imgSrc);
      }),
    );
  }
}
