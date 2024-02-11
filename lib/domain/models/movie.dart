import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String overview;
  final String poster;
  final int id;
  final DateTime releaseDate;

  const Movie(
      {required this.title,
      required this.overview,
      required this.poster,
      required this.id,
      required this.releaseDate});

  @override
  List<Object?> get props =>
      <Object?>[title, overview, poster, id, releaseDate];
}
