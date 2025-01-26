import 'package:blocwitmvvm/config/app_url.dart';
import 'package:blocwitmvvm/config/model/movie/movie.dart';
import 'package:blocwitmvvm/data/network/network_service_api.dart';

import 'package:blocwitmvvm/repository/movies/movies_repo.dart';

class MoviesApiRepo implements MoviesRepo {
  final _apiServices = NetworkServiceApi();

  @override
  Future<MovieModel> fetchMovieList() async {
    // TODO: implement fetchMovieList
    final response = await _apiServices.getApi(AppUrl.movieApi);
    return MovieModel.fromJson(response);
  }
}
