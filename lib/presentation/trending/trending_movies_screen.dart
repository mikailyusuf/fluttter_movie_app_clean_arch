import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/discover/discover_movie_cubit.dart';
import 'package:movie_app/presentation/discover/discover_movie_state.dart';
import 'package:movie_app/presentation/discover/movie_card.dart';

class TrendingMoviesScreen extends StatefulWidget {
  const TrendingMoviesScreen({super.key});

  @override
  State<TrendingMoviesScreen> createState() => _TrendingMoviesScreenState();
}

class _TrendingMoviesScreenState extends State<TrendingMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending Movies"),
      ),
      body: BlocBuilder<MoviesCubit, DiscoverMovieState>(
        builder: (context, state) {
          return state.trendingMoviesList.isNotEmpty
              ? ListView.builder(
                  itemCount: state.trendingMoviesList.length,
                  itemBuilder: (context, index) {
                    final movie = state.trendingMoviesList[index];
                    return MovieCard(
                      imageUrl: movie.poster,
                      title: movie.title,
                    );
                  })
              : const Center(
                  child: Text('Fetching Data'),
                );
        },
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().fetchTrendingMovies();
  }
}
