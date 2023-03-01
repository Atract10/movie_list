import 'package:flutter/material.dart';
import 'package:movie_list/models/movie_model.dart';
import 'package:movie_list/services/movie_service.dart';

import 'movie_details_view_model.dart';

class HomePageViewModel extends ChangeNotifier {
  final _apiClient = MovieService();
  List<MovieModel> _movieList = [];
  var _page = 0;
  final movieDetailsViewModel = MovieDetailsPageViewModel();

  List<MovieModel> get movieList => _movieList;

  void getMovieListAction() async {
    _page++;
    final movieList = await _apiClient.getMovies(_page);
    _movieList = movieList;
    notifyListeners();
  }

  void updateMovieListAction(int index) async {
    if (index < _movieList.length - 4) return;
    _page++;
    final movieList = await _apiClient.getMovies(_page);
    for (var element in movieList) {
      _movieList.add(element);
    }
    notifyListeners();
  }
}
