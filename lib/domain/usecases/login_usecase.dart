import 'package:dartz/dartz.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/core/usecases/usecase.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/user.dart';
import 'package:tdd_clean_flutter_todo/domain/repositories/auth_repository.dart';

class LoginUsecase extends UseCase<User?, LoginInfo> {
  final AuthRepository authRepository;
  LoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, User?>> call(LoginInfo params) async {
    try {
      return await authRepository.login(params);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
