// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:movie_list/models/movie_list_model.dart';
import '../models/movie_model.dart';

class MovieService {
  final apiClient = Dio();
  final apikey = 'c775c857b17bd9db8c5a8e9230edefe4';

  Future<List<MovieModel>> getMovies(int page) async {
    try {
      var url =
          'https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey&language=en-US&page=$page';
      final request = await apiClient.get(url);
      final json = request.data;
      final movieList = MovieListModel.fromJson(json).movieList;
      return movieList;
    } catch (e) {
      return <MovieModel>[];
    }
  }

  Future<MovieModel?> getMovieDetails(int movieId) async {
    try {
      var url =
          'https://api.themoviedb.org/3/movie/$movieId?api_key=$apikey&language=en-US';
      final request = await apiClient.get(url);
      final json = request.data;
      final movieDetails = MovieModel.fromJson(json);
      return movieDetails;
    } catch (e) {
      return null;
    }
  }
}
