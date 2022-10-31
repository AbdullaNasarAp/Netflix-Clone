import 'movie_model.dart';

class MoviesResultModel {
  late final List<Results> movies;

  MoviesResultModel({required this.movies});

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    var movies = List<Results>.empty(growable: true);
    if (json['results'] != null) {
      json['results'].forEach((v) {
        final movieModel = Results.fromJson(v);
        if (_isValidMovie(movieModel)) {
          movies.add(movieModel);
        }
      });
    }
    return MoviesResultModel(movies: movies);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.movies.map((v) => v.toJson()).toList();
    return data;
  }
}

bool _isValidMovie(Results movieModel) {
  return movieModel.id != -1 &&
      movieModel.title.isNotEmpty &&
      movieModel.backdropPath.isNotEmpty &&
      movieModel.posterPath.isNotEmpty;
}
