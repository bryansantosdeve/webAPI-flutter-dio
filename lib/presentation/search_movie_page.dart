import 'package:flutter/material.dart';
import 'package:studio_ghibli_studio/data/movie_model.dart';
import 'package:studio_ghibli_studio/external/remote_datasource.dart';
import 'package:studio_ghibli_studio/shared/custom_app_bar.dart';
import 'package:studio_ghibli_studio/shared/custom_text_form_field.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});

  @override
  State<SearchMoviePage> createState() => _SearchMoviePage();
}

class _SearchMoviePage extends State<SearchMoviePage> {
  final RemoteDatasource datasource = RemoteDatasource();

  late Future<List<MovieModel>>? moviesToSuggest;

  late List<MovieModel>? movies = [];

  final controller = TextEditingController();

  @override
  void initState() {
    moviesToSuggest = datasource.getMovies();
    super.initState();
  }

  void updateList(String input) async {
    setState(() {
      movies = movies!
          .where((element) =>
              element.name.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'SEARCH GHIBLI MOVIES',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: controller,
              onChanged: (value) => updateList(value!),
            ),
            Expanded(
              child: FutureBuilder(
                future: moviesToSuggest,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    movies = snapshot.data as List<MovieModel>;
                    return ListView.builder(
                      itemCount: movies!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            contentPadding: const EdgeInsets.all(10.0),
                            tileColor: Colors.white,
                            title: Text(
                              movies![index].name,
                            ),
                            leading: Image.network(movies![index].imgSrc)),
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
