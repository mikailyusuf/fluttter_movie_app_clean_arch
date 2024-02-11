import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/api_result_model.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/domain/repositories/movies_repository.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

@injectable
class SearchMoviesUseCase implements BaseParamsUseCase<List<Movie>?, String> {
  SearchMoviesUseCase(this.moviesRepository);

  final MoviesRepository moviesRepository;

  @override
  Future<ApiResultModel<List<Movie>?>> call(String? params) {
    return moviesRepository.searchMovie(params ?? '');
  }
}
