import 'package:flutter/material.dart';
import 'package:studio_ghibli_studio/data/movie_model.dart';
import 'package:studio_ghibli_studio/external/remote_datasource.dart';
import 'package:studio_ghibli_studio/shared/movies_grid_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RemoteDatasource datasource = RemoteDatasource();

  late Future<List<MovieModel>>? futureMovies;

  @override
  void initState() {
    futureMovies = datasource.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text.rich(TextSpan(text: 'STUDIO GHIBLI: API WEB USING DIO')),
      ),
      body: FutureBuilder(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movies = snapshot.data as List<MovieModel>;
            return MoviesGridView(listOfMovies: movies);
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('IMPOSSIVEL DE CONECTAR'),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
