import 'package:netflix_clone/api_model/movie_model.dart';

import '../api_model/api_model.dart';
import 'api_client.dart';

abstract class MovieRemoteDataSource {
  Future<List<Results>> getTrending();
  Future<List<Results>> getPopular();
  Future<List<Results>> getPlayingNow();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<Results>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<Results>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<Results>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<Results>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
