import 'package:dartz/dartz.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_local_data_source.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_remote_data_source.dart';
import 'package:tdd_clean_flutter_todo/data/models/login_info_model.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/user.dart';
import 'package:tdd_clean_flutter_todo/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, LoginInfo>> getLoginInfo() async {
    final result = await localDataSource.getLoginInfo();

    if (result != null) {
      return Right(result.toEntity());
    }

    return Left(LocalFailure('No login info found'));
  }

  @override
  Future<bool> removeLoginInfo() async {
    return await localDataSource.removeLoginInfo();
  }

  @override
  Future<bool> saveLoginInfo(LoginInfo loginInfo) async {
    return await localDataSource
        .saveLoginInfo(LoginInfoModel.fromEntity(loginInfo));
  }

  @override
  Future<Either<Failure, User>> login(LoginInfo loginInfo) async {
    final result =
        await remoteDataSource.login(LoginInfoModel.fromEntity(loginInfo));

    if (result == null) {
      return Left(NotFoundFailure('User not found'));
    }

    return Right(result.toEntity());
  }
}
