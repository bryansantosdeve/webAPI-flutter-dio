class MovieModel {
  MovieModel({required this.name, required this.imgSrc});
  final String name;

  final String imgSrc;

  /// It'll return a model from a json
  MovieModel.fromJson(Map<String, dynamic> json)
      : name = json["nome"].toString(),
        imgSrc = json["imagem"];
}
