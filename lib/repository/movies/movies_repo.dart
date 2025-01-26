
import 'package:blocwitmvvm/config/model/movie/movie.dart';
abstract class MoviesRepo {
  Future<MovieModel> fetchMovieList();
 
}