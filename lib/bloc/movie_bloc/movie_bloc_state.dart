part of 'movie_bloc_bloc.dart';

class MovieBlocState extends Equatable {
  const MovieBlocState({required this.moviesList});

  final ApiRsponse moviesList;

  MovieBlocState copyWith({
    ApiRsponse<MovieModel>? moviesList,
  }) {
    return MovieBlocState(moviesList: moviesList ?? this.moviesList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [moviesList];
}
