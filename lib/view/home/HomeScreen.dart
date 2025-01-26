import 'package:blocwitmvvm/bloc/movie_bloc/bloc/movie_bloc_bloc.dart';
import 'package:blocwitmvvm/config/routes/routeName.dart';
import 'package:blocwitmvvm/dependency_injection/locator.dart';

import 'package:blocwitmvvm/service/storage/local_storage.dart';
import 'package:blocwitmvvm/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movie_bloc/bloc/movie_bloc_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _logout(BuildContext context) async {
    try {
      LocalStorage localStorage = LocalStorage();
      await localStorage.clearValue('token');
      await localStorage.clearValue('isLogin');
      Navigator.pushNamed(context, RoutesName.loginScreen);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout failed: $e")),
      );
    }
  }

  late MovieBlocBloc movieBloc;

  @override
  void initState() {
    super.initState();
    movieBloc = MovieBlocBloc(moviesRepo: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => movieBloc..add(MovieFetched()),
        child: BlocBuilder<MovieBlocBloc, MovieBlocState>(
          builder: (context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());

              case Status.completed:
                final movies = state.moviesList.data;
                if (movies == null || movies.tvShow.isEmpty) {
                  return const Center(child: Text('No movies available.'));
                }
                return ListView.builder(
                  itemCount: movies.tvShow.length,
                  itemBuilder: (context, index) {
                    final tvShow = movies.tvShow[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        leading: Image.network(
                          tvShow.imageThumbnailPath ??
                              'https://via.placeholder.com/150',
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        ),
                        title: Text(tvShow.name.isNotEmpty
                            ? tvShow.name
                            : 'Unnamed Show'),
                        subtitle: Text(tvShow.network.isNotEmpty
                            ? tvShow.network
                            : 'Unknown Network'),
                        trailing: Text(
                          tvShow.status.isNotEmpty
                              ? tvShow.status
                              : 'Unknown Status',
                          style: TextStyle(
                            color: tvShow.status == 'Ended'
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                      ),
                    );
                  },
                );

              case Status.error:
                return Center(
                  child: Text(state.moviesList.message ?? 'Error occurred.'),
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
