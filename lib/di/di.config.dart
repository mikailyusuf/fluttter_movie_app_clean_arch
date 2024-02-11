// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/utils/mapper/connectivity_checker.dart' as _i3;
import '../data/remote_datasource/movie_remote_datasource.dart' as _i4;
import '../data/repository/movies_repository_impl.dart' as _i6;
import '../domain/repositories/movies_repository.dart' as _i5;
import '../domain/usecases/get_discover_movies_usecase.dart' as _i8;
import '../domain/usecases/get_trending_movies_usecase.dart' as _i9;
import '../domain/usecases/search_movies_usecase.dart' as _i7;
import '../presentation/discover/movies_cubit.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ConnectivityCheckerHelper>(
        () => _i3.ConnectivityCheckerHelper());
    gh.factory<_i4.MoviesRemoteDataSource>(
        () => _i4.MoviesRemoteDataSourceImpl());
    gh.factory<_i5.MoviesRepository>(() => _i6.MoviesRepositoryImpl(
        remoteDataSource: gh<_i4.MoviesRemoteDataSource>()));
    gh.factory<_i7.SearchMoviesUseCase>(
        () => _i7.SearchMoviesUseCase(gh<_i5.MoviesRepository>()));
    gh.factory<_i8.GetDiscoverMoviesUseCase>(
        () => _i8.GetDiscoverMoviesUseCase(gh<_i5.MoviesRepository>()));
    gh.factory<_i9.GetTrendingMoviesUseCase>(
        () => _i9.GetTrendingMoviesUseCase(gh<_i5.MoviesRepository>()));
    gh.factory<_i10.MoviesCubit>(() => _i10.MoviesCubit(
          discoverMoviesUseCase: gh<_i8.GetDiscoverMoviesUseCase>(),
          trendingMoviesUseCase: gh<_i9.GetTrendingMoviesUseCase>(),
          searchMoviesUseCase: gh<_i7.SearchMoviesUseCase>(),
        ));
    return this;
  }
}
