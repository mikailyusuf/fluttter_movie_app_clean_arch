import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/core/data_mapper.dart';
import 'package:movie_app/domain/models/movie.dart';

part 'movies_api_response.g.dart';

@JsonSerializable()
class MoviesApiResponseModel extends DataMapper<List<Movie>> {
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'results')
  final List<Result>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  MoviesApiResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MoviesApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesApiResponseModelFromJson(json);

  @override
  List<Movie> mapToEntity() {
    return results
            ?.map((e) => Movie(
                title: e.title ?? '',
                overview: e.overview ?? '',
                poster: "https://image.tmdb.org/t/p/w500/${e.posterPath ?? ''}",
                id: e.id ?? 0,
                releaseDate: e.releaseDate ?? ''))
            .toList() ??
        List<Movie>.empty();
  }
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'adult')
  final bool? adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @JsonKey(name: 'original_title')
  final String? originalTitle;
  @JsonKey(name: 'overview')
  final String? overview;
  @JsonKey(name: 'popularity')
  final double? popularity;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'video')
  final bool? video;
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @JsonKey(name: 'vote_count')
  final int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
}
