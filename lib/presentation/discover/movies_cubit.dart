import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/api_result_model.dart';
import 'package:movie_app/domain/usecases/base_usecase.dart';
import 'package:movie_app/domain/usecases/get_discover_movies_usecase.dart';
import 'package:movie_app/domain/usecases/get_trending_movies_usecase.dart';
import 'package:movie_app/domain/usecases/search_movies_usecase.dart';
import 'package:movie_app/presentation/common/base_cubit_state.dart';
import 'package:movie_app/presentation/common/base_cubit_wrapper.dart';
import 'package:movie_app/presentation/discover/discover_movie_state.dart';
import 'package:movie_app/util/debouncer.dart';

@injectable
class MoviesCubit extends BaseCubitWrapper<DiscoverMovieState> {
  MoviesCubit({
    required this.discoverMoviesUseCase,
    required this.trendingMoviesUseCase,
    required this.searchMoviesUseCase,
  }) : super(DiscoverMovieState(
            trendingMoviesList: List.empty(),
            discoverMoviesList: List.empty(),
            searchList: List.empty(),
            cubitState: CubitState.initial()));

  final GetDiscoverMoviesUseCase discoverMoviesUseCase;
  final GetTrendingMoviesUseCase trendingMoviesUseCase;
  final SearchMoviesUseCase searchMoviesUseCase;
  final _debouncer = Debouncer(milliseconds: 300);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initialize() {
    // TODO: implement initialize
  }

  void onSearchQueryChanges(String query) {
    _debouncer.run(() {
      searchMovies(query);
    });
  }

  void fetchDiscoverMovies() async {
    emit(state.copywith(cubitState: CubitLoading()));
    final result = await discoverMoviesUseCase(NoParams());
    result.when(
      success: (movies) {
        emit(state.copywith(
            cubitState: CubitInitial(), discoverMoviesList: movies));
      },
      failure: (ErrorResultModel errorResultEntity) {
        emit(state.copywith(
            cubitState: CubitError(
                message: errorResultEntity.message ?? 'An error occured')));
      },
    );
  }

  void fetchTrendingMovies() async {
    emit(state.copywith(cubitState: CubitLoading()));
    final result = await trendingMoviesUseCase(NoParams());
    result.when(
      success: (movies) {
        emit(state.copywith(
            cubitState: CubitInitial(), trendingMoviesList: movies));
      },
      failure: (ErrorResultModel errorResultEntity) {
        emit(state.copywith(
            cubitState: CubitError(
                message: errorResultEntity.message ?? 'An error occurred')));
      },
    );
  }

  void searchMovies(String query) async {
    emit(state.copywith(cubitState: CubitLoading()));
    final result = await searchMoviesUseCase(query);
    result.when(
      success: (movies) {
        emit(state.copywith(cubitState: CubitInitial(), searchList: movies));
      },
      failure: (ErrorResultModel errorResultEntity) {
        emit(state.copywith(
            cubitState: CubitError(
                message: errorResultEntity.message ?? 'An error occurred')));
      },
    );
  }
}
