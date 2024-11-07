import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/core/usecases/usecase.dart';
import 'package:tdd_clean_flutter_todo/domain/usecases/get_login_info_usecase.dart';

import '../../helpers/test_constants/test_constants.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late GetLoginInfoUsecase getLoginInfoUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    getLoginInfoUsecase = GetLoginInfoUsecase(repository: mockAuthRepository);
  });

  group('GetLoginInfoUsecase', () {
    test('should return LoginInfo when exists', () async {
      // Arrange
      when(() => mockAuthRepository.getLoginInfo())
          .thenAnswer((_) async => const Right(tLoginInfo));

      // Act
      final result = await getLoginInfoUsecase(NoParams());

      // Assert
      result.fold(
        (failure) => null,
        (loginInfo) => expect(loginInfo, tLoginInfo),
      );
      verify(() => mockAuthRepository.getLoginInfo());
    });

    test('should return failure when loginInfo is empty', () async {
      // Arrange
      when(() => mockAuthRepository.getLoginInfo())
          .thenAnswer((_) async => Left(LocalFailure('No login info found')));

      // Act
      final result = await getLoginInfoUsecase(NoParams());

      // Assert
      result.fold(
        (failure) => expect(failure, LocalFailure('No login info found')),
        (loginInfo) => null,
      );
      verify(() => mockAuthRepository.getLoginInfo());
    });
  });
}
