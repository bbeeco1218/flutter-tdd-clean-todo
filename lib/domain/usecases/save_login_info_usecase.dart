import 'package:dartz/dartz.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/core/usecases/usecase.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';
import 'package:tdd_clean_flutter_todo/domain/repositories/auth_repository.dart';

class SaveLoginInfoUsecase extends UseCase<NoParams, LoginInfo> {
  final AuthRepository repository;
  SaveLoginInfoUsecase({required this.repository});
  @override
  Future<Either<Failure, NoParams>> call(LoginInfo params) async {
    final result = await repository.saveLoginInfo(params);
    if (result) {
      return Right(NoParams());
    }

    return Left(LocalFailure('Failed to save login info'));
  }
}
