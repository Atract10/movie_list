// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) =>
    MovieListModel(
      movieList: (json['results'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieListModelToJson(MovieListModel instance) =>
    <String, dynamic>{
      'results': instance.movieList,
    };
