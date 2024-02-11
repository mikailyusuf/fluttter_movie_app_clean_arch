import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/usecases/get_discover_movies_usecase.dart';
import 'package:movie_app/domain/usecases/get_trending_movies_usecase.dart';
import 'package:movie_app/domain/usecases/search_movies_usecase.dart';
import 'package:movie_app/presentation/discover/movies_cubit.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

List<BlocProvider> initialiseCubits() {
  return [
    BlocProvider<MoviesCubit>(
      create: (context) => MoviesCubit(
        discoverMoviesUseCase: getIt.get<GetDiscoverMoviesUseCase>(),
        trendingMoviesUseCase: getIt.get<GetTrendingMoviesUseCase>(),
        searchMoviesUseCase: getIt.get<SearchMoviesUseCase>(),
      ),
    )
  ];
}
