import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:studio_ghibli_studio/data/movie_model.dart';

class RemoteDatasource {
  Future<List<MovieModel>>? getMovies() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json');

      final json = jsonDecode(response.data);

      final list = List<MovieModel>.from(
        json.map(
          (movie) => MovieModel.fromJson(movie),
        ),
      );

      print('LISTA DE FILMES : $list');
      return list;
    } on DioError catch (ex) {
      print(ex.error);
      rethrow;
    } finally {
      dio.close();
    }
  }
}
