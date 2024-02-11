import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/common/base_cubit_state.dart';
import 'package:movie_app/presentation/discover/movies_cubit.dart';
import 'package:movie_app/presentation/discover/discover_movie_state.dart';
import 'package:movie_app/presentation/discover/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late MoviesCubit _cubit;
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MoviesCubit, DiscoverMovieState>(
        listener: (BuildContext context, DiscoverMovieState state) {
          if (state.cubitState is CubitLoading) {
            setState(() {
              isLoading = true;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      onChanged: (text) {
                        _cubit.onSearchQueryChanges(text);
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Text',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      state.searchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.searchList.length,
                              itemBuilder: (context, index) {
                                final movie = state.searchList[index];
                                return MovieCard(
                                  imageUrl: movie.poster,
                                  title: movie.title,
                                );
                              },
                            )
                          : const SizedBox(),
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox()
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _cubit = context.read<MoviesCubit>();
    _cubit.fetchDiscoverMovies();
  }
}
