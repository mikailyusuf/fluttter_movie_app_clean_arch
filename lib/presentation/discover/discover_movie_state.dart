import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/presentation/common/base_cubit_state.dart';

class DiscoverMovieState extends Equatable {
  final BaseCubitState cubitState;
  final List<Movie> discoverMoviesList;
  final List<Movie> trendingMoviesList;

  const DiscoverMovieState(
      {required this.discoverMoviesList,
      required this.trendingMoviesList,
      required this.cubitState});

  @override
  List<Object?> get props =>
      [trendingMoviesList, discoverMoviesList, cubitState];

  DiscoverMovieState copywith({
    BaseCubitState? cubitState,
    List<Movie>? discoverMoviesList,
    List<Movie>? trendingMoviesList,
  }) {
    return DiscoverMovieState(
        discoverMoviesList: discoverMoviesList ?? this.discoverMoviesList,
        trendingMoviesList: trendingMoviesList ?? this.trendingMoviesList,
        cubitState: cubitState ?? this.cubitState);
  }
}
