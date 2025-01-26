import 'package:get_it/get_it.dart';
import 'dependency_imjection.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void servicesLocator() {
    getIt.registerLazySingleton<LoginRepo>(() => LoginHttpApiRepo());
    getIt.registerLazySingleton<MoviesRepo>(() => MoviesApiRepo());
  }
}
