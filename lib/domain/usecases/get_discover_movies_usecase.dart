import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/api_result_model.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/domain/repositories/movies_repository.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';

@injectable
class GetDiscoverMoviesUseCase
    implements BaseParamsUseCase<List<Movie>?, NoParams> {
  GetDiscoverMoviesUseCase(this.moviesRepository);

  final MoviesRepository moviesRepository;

  @override
  Future<ApiResultModel<List<Movie>?>> call(NoParams? params) {
    return moviesRepository.getDiscoverMovies();
  }
}
