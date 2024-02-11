import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/discover/movies_cubit.dart';
import 'package:movie_app/presentation/discover/discover_movie_state.dart';
import 'package:movie_app/presentation/discover/movie_card.dart';

class DiscoverMoviesScreen extends StatefulWidget {
  const DiscoverMoviesScreen({super.key});

  @override
  State<DiscoverMoviesScreen> createState() => _DiscoverMoviesScreenState();
}

class _DiscoverMoviesScreenState extends State<DiscoverMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover Movies"),
      ),
      body: BlocBuilder<MoviesCubit, DiscoverMovieState>(
        builder: (context, state) {
          return state.discoverMoviesList.isNotEmpty
              ? ListView.builder(
                  itemCount: state.discoverMoviesList.length,
                  itemBuilder: (context, index) {
                    final movie = state.discoverMoviesList[index];
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
    context.read<MoviesCubit>().fetchDiscoverMovies();
  }
}
