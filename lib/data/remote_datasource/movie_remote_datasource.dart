// ignore_for_file: unused_import

import 'package:injectable/injectable.dart';
import 'package:movie_app/core/utils/helpers/base_api_client.dart';
import 'package:movie_app/data/responses/movies_api_response.dart';
import 'package:movie_app/domain/api_result_model.dart';
import 'package:movie_app/domain/models/movie.dart';

abstract class MoviesRemoteDataSource {
  Future<ApiResultModel<MoviesApiResponseModel>> getDiscoverMovies();
  Future<ApiResultModel<MoviesApiResponseModel>> getTrendingMovies();
}

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl extends BaseApiClient
    implements MoviesRemoteDataSource {
  @override
  Future<ApiResultModel<MoviesApiResponseModel>> getDiscoverMovies() async {
    Map<String, dynamic> queryParams = {
      'include_adult': 'false',
      'include_video': 'false',
      'language': 'en-US',
      'page': '1',
      'sort_by': 'popularity.desc',
      'with_release_type': '2|3'
    };
    final response = await get('discover/movie', queryParameters: queryParams);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final dynamic jsonData = response.data ?? {};
      final data = MoviesApiResponseModel.fromJson(jsonData);
      return ApiResultModel.success(data: data);
    } else {
      return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
              message: response.statusMessage, statusCode: statusCode));
    }
  }

  @override
  Future<ApiResultModel<MoviesApiResponseModel>> getTrendingMovies() async {
    Map<String, dynamic> queryParams = {
      'language': 'en-US',
    };
    final response =
        await get('trending/movie/day', queryParameters: queryParams);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final dynamic jsonData = response.data ?? {};
      final data = MoviesApiResponseModel.fromJson(jsonData);
      return ApiResultModel.success(data: data);
    } else {
      return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
              message: response.statusMessage, statusCode: statusCode));
    }
  }
}
