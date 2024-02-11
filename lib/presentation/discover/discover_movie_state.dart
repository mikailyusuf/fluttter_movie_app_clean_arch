import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/presentation/common/base_cubit_state.dart';

class DiscoverMovieState extends Equatable {
  final BaseCubitState cubitState;
  final List<Movie> discoverMoviesList;
  final List<Movie> trendingMoviesList;
  final List<Movie> searchList;

  const DiscoverMovieState(
      {required this.discoverMoviesList,
      required this.trendingMoviesList,
      required this.searchList,
      required this.cubitState});

  @override
  List<Object?> get props =>
      [trendingMoviesList, discoverMoviesList, searchList, cubitState];

  DiscoverMovieState copywith({
    BaseCubitState? cubitState,
    List<Movie>? discoverMoviesList,
    List<Movie>? trendingMoviesList,
    List<Movie>? searchList,
  }) {
    return DiscoverMovieState(
        discoverMoviesList: discoverMoviesList ?? this.discoverMoviesList,
        trendingMoviesList: trendingMoviesList ?? this.trendingMoviesList,
        searchList: searchList ?? this.searchList,
        cubitState: cubitState ?? this.cubitState);
  }
}
