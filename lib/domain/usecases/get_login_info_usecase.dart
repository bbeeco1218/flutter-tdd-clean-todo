import 'package:dartz/dartz.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/core/usecases/usecase.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';
import 'package:tdd_clean_flutter_todo/domain/repositories/auth_repository.dart';

class GetLoginInfoUsecase extends UseCase<LoginInfo, NoParams> {
  final AuthRepository repository;
  GetLoginInfoUsecase({required this.repository});

  @override
  Future<Either<Failure, LoginInfo>> call(NoParams params) {
    return repository.getLoginInfo();
  }
}
