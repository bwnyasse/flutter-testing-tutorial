// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) {
  return MoviesResponse(
    page: json['page'] as int,
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
    movies: (json['results'] as List)
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.movies,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    video: json['video'] as bool,
    voteCount: json['vote_count'] as int,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    title: json['title'] as String,
    posterPath: json['poster_path'] as String,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    adult: json['adult'] as bool,
    overview: json['overview'] as String,
    backdropPath: json['backdrop_path'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    releaseDate: json['release_date'] as String,
    favorite: json['favorite'] as bool ?? false,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'adult': instance.adult,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'favorite': instance.favorite,
    };
