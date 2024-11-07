import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_local_data_source.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_remote_data_source.dart';
import 'package:tdd_clean_flutter_todo/data/repositories/auth_repository_impl.dart';
import 'package:tdd_clean_flutter_todo/domain/repositories/auth_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);

  // Data sources
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: locator(),
    ),
  );

  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: locator(),
      remoteDataSource: locator(),
    ),
  );
}
