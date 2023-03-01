import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  String title;
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'vote_average')
  double averageVote;
  int id;
  MovieModel({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.averageVote,
    required this.id,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
