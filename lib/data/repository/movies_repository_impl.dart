import 'package:injectable/injectable.dart';
import 'package:movie_app/data/remote_datasource/movie_remote_datasource.dart';
import 'package:movie_app/data/responses/movies_api_response.dart';
import 'package:movie_app/domain/api_result_model.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/domain/repositories/movies_repository.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl({
    required this.remoteDataSource,
  });

  final MoviesRemoteDataSource remoteDataSource;
  @override
  Future<ApiResultModel<List<Movie>>> getDiscoverMovies() async {
    try {
      final ApiResultModel<MoviesApiResponseModel> _result =
          await remoteDataSource.getDiscoverMovies();
      return _result.when(
          success: (MoviesApiResponseModel moviesResponse) async {
        return ApiResultModel.success(data: moviesResponse.mapToEntity());
      }, failure: (ErrorResultModel errorResponse) {
        return ApiResultModel.failure(errorResultEntity: errorResponse);
      });
    } catch (e) {
      return const ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
              statusCode: 400, message: 'Unable to Load Data'));
    }
  }

  @override
  Future<ApiResultModel<List<Movie>>> getTrendingMovies() async {
    try {
      final ApiResultModel<MoviesApiResponseModel> _result =
          await remoteDataSource.getTrendingMovies();
      return _result.when(
          success: (MoviesApiResponseModel moviesResponse) async {
        return ApiResultModel.success(data: moviesResponse.mapToEntity());
      }, failure: (ErrorResultModel errorResponse) {
        return ApiResultModel.failure(errorResultEntity: errorResponse);
      });
    } catch (e) {
      return const ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
              statusCode: 400, message: 'Unable to Load Data'));
    }
  }

  @override
  Future<ApiResultModel<List<Movie>>> searchMovie(String query) async {
    try {
      final ApiResultModel<MoviesApiResponseModel> _result =
          await remoteDataSource.searchMovie(query);
      return _result.when(
          success: (MoviesApiResponseModel moviesResponse) async {
        return ApiResultModel.success(data: moviesResponse.mapToEntity());
      }, failure: (ErrorResultModel errorResponse) {
        return ApiResultModel.failure(errorResultEntity: errorResponse);
      });
    } catch (e) {
      return const ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
              statusCode: 400, message: 'Unable to Load Data'));
    }
  }
}
