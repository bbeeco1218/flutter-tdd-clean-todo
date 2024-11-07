import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_local_data_source.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_remote_data_source.dart';
import 'package:tdd_clean_flutter_todo/domain/repositories/auth_repository.dart';

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}
