import 'package:dartz/dartz.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/user.dart';

abstract class AuthRepository {
  Future<bool> saveLoginInfo(LoginInfo loginInfo);
  Future<Either<Failure, LoginInfo>> getLoginInfo();
  Future<bool> removeLoginInfo();
  Future<Either<Failure, User>> login(LoginInfo loginInfo);
}
