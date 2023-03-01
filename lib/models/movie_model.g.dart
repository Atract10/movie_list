// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      averageVote: (json['vote_average'] as num).toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.averageVote,
      'id': instance.id,
    };
