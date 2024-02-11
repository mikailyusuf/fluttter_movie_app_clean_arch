import 'package:movie_app/domain/api_result_model.dart';
import 'package:movie_app/domain/models/movie.dart';

abstract class MoviesRepository {
  Future<ApiResultModel<List<Movie>>> getDiscoverMovies();
  Future<ApiResultModel<List<Movie>>> getTrendingMovies();
  Future<ApiResultModel<List<Movie>>> searchMovie(String query);
}
