import 'package:flutter/material.dart';
import 'package:movie_list/models/movie_model.dart';
import 'package:movie_list/services/movie_service.dart';

class MovieDetailsPageViewModel extends ChangeNotifier {
  final _apiClient = MovieService();
  MovieModel? _movieDetails;

  MovieModel? get movieDetails => _movieDetails;

  void getMovieDetailsAction(int movieId) async {
    final movieDetails = await _apiClient.getMovieDetails(movieId);
    _movieDetails = movieDetails;
    notifyListeners();
  }

  setDetails(MovieModel? movieDetails) {
    _movieDetails = movieDetails;
  }
}
