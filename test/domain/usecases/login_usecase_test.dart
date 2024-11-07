import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/domain/usecases/login_usecase.dart';

import '../../helpers/test_constants/test_constants.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUsecase loginUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(authRepository: mockAuthRepository);
  });

  test('should return User when login success', () async {
    // Arrange
    when(() => mockAuthRepository.login(tLoginInfo))
        .thenAnswer((_) async => const Right(tUser));

    // Act
    final result = await loginUsecase(tLoginInfo);

    // Assert
    expect(result, const Right(tUser));
  });

  test('should return failure when login failed', () async {
    // Arrange
    when(() => mockAuthRepository.login(tLoginInfo))
        .thenAnswer((_) async => Left(NotFoundFailure('User not found')));

    // Act
    final result = await loginUsecase(tLoginInfo);

    // Assert
    expect(result, Left(NotFoundFailure('User not found')));
  });

  test('should return failure when login throws exception', () async {
    // Arrange
    when(() => mockAuthRepository.login(tLoginInfo)).thenThrow(Exception());

    // Act
    final result = await loginUsecase(tLoginInfo);

    // Assert
    expect(result, Left(ServerFailure()));
  });
}
