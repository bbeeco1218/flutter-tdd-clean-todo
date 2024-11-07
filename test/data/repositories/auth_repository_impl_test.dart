import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/data/repositories/auth_repository_impl.dart';

import '../../helpers/test_constants/test_constants.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepositoryImpl authRepositoryImpl;

  setUp(() {
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();

    authRepositoryImpl = AuthRepositoryImpl(
      localDataSource: mockAuthLocalDataSource,
      remoteDataSource: mockAuthRemoteDataSource,
    );
  });

  group('getLoginInfo', () {
    test('should return LoginInfo when exists', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.getLoginInfo())
          .thenAnswer((_) async => tLoginInfoModel);

      // Act
      final result = await authRepositoryImpl.getLoginInfo();

      // Assert
      expect(result, const Right(tLoginInfo));
    });

    test('should return failure when loginInfo is empty', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.getLoginInfo())
          .thenAnswer((_) async => null);

      // Act
      final result = await authRepositoryImpl.getLoginInfo();

      // Assert
      expect(result, Left(LocalFailure('No login info found')));
    });
  });

  group('removeLoginInfo', () {
    test('should return true when remove login info success', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.removeLoginInfo())
          .thenAnswer((_) async => true);

      // Act
      final result = await authRepositoryImpl.removeLoginInfo();

      // Assert
      expect(result, true);
    });

    test('should return false when remove login info fails', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.removeLoginInfo())
          .thenAnswer((_) async => false);

      // Act
      final result = await authRepositoryImpl.removeLoginInfo();

      // Assert
      expect(result, false);
    });
  });

  group('saveLoginInfo', () {
    test('should return true when save login info success', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.saveLoginInfo(tLoginInfoModel))
          .thenAnswer((_) async => true);

      // Act
      final result = await authRepositoryImpl.saveLoginInfo(tLoginInfo);

      // Assert
      expect(result, true);
    });

    test('should return false when save login info fails', () async {
      // Arrange
      when(() => mockAuthLocalDataSource.saveLoginInfo(tLoginInfoModel))
          .thenAnswer((_) async => false);

      // Act
      final result = await authRepositoryImpl.saveLoginInfo(tLoginInfo);

      // Assert
      expect(result, false);
    });
  });

  group('login', () {
    test('should return LoginInfo when login success', () async {
      // Arrange
      when(() => mockAuthRemoteDataSource.login(tLoginInfoModel))
          .thenAnswer((_) async => tUserModel);

      // Act
      final result = await authRepositoryImpl.login(tLoginInfo);

      // Assert
      result.fold(
        (failure) => null,
        (user) => expect(user, tUser),
      );
    });

    test('should return failure when login fails', () async {
      // Arrange
      when(() => mockAuthRemoteDataSource.login(tLoginInfoModel))
          .thenAnswer((_) async => null);

      // Act
      final result = await authRepositoryImpl.login(tLoginInfo);

      // Assert
      result.fold(
        (failure) => expect(failure, NotFoundFailure('User not found')),
        (user) => null,
      );
    });
  });
}
