import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'movie_list_model.g.dart';

@JsonSerializable()
class MovieListModel {
  @JsonKey(name: 'results')
  List<MovieModel> movieList;
  MovieListModel({
    required this.movieList,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListModelToJson(this);
}
