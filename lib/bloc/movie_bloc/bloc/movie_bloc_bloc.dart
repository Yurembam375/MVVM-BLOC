

import 'package:bloc/bloc.dart';
import 'package:blocwitmvvm/bloc/movie_bloc/bloc/movie_bloc_event.dart';
import 'package:blocwitmvvm/config/model/movie/movie.dart';
import 'package:blocwitmvvm/data/response/api_rsponse.dart';
import 'package:blocwitmvvm/repository/movies/movies_repo.dart';
import 'package:equatable/equatable.dart';

part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MoviesBlocEvent, MovieBlocState> {
  MoviesRepo moviesRepo;
  MovieBlocBloc({required this.moviesRepo})
      : super(MovieBlocState(moviesList: ApiRsponse.loading())) {
    on<MovieFetched>(fetchMovieListApi);
  }

  Future<void> fetchMovieListApi(
      MovieFetched event, Emitter<MovieBlocState> emit) async {
    await moviesRepo.fetchMovieList().then(
      (value) {
            print('Movie List Fetched Successfully: $value');
        emit(state.copyWith(moviesList: ApiRsponse.completed(value)));
      },
    ).onError(
      (error, stackTrace) {
        emit(state.copyWith(moviesList: ApiRsponse.error(error.toString())));
      },
    );
  }
}
