import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_flutter_todo/core/constant/shared_key.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_local_data_source.dart';

import '../../../helpers/fixtures/fixture_reader.dart';
import '../../../helpers/test_constants/test_constants.dart';
import '../../../helpers/test_helpers.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late AuthLocalDataSourceImpl authLocalDataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    authLocalDataSource = AuthLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('save Login Info', () {
    test('should return LoginInfo on successful save', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(
              cacheLoginInfoKey, json.encode(tLoginInfoModel.toJson())))
          .thenAnswer((_) async => true);

      // Act
      final result = await authLocalDataSource.saveLoginInfo(tLoginInfoModel);

      // Assert
      expect(result, true);
    });

    test('should return failure when caching loginInfo fails', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(
              cacheLoginInfoKey, json.encode(tLoginInfoModel.toJson())))
          .thenAnswer((_) async => false);

      // Act
      final result = await authLocalDataSource.saveLoginInfo(tLoginInfoModel);

      // Assert
      expect(result, false);
    });
  });

  group('get Login Info', () {
    test('should return LoginInfo when exists', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(cacheLoginInfoKey))
          .thenReturn(fixture('login_info/login_info.json'));

      // Act
      final result = await authLocalDataSource.getLoginInfo();

      // Assert
      expect(result, tLoginInfoModel);
    });

    test('should return failure when loginInfo is empty', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(cacheLoginInfoKey))
          .thenReturn(null);

      // Act
      final result = await authLocalDataSource.getLoginInfo();

      // Assert
      expect(result, null);
    });
  });

  group('remove Login Info', () {
    test('should return true when loginInfo is removed successfully', () async {
      // Arrange
      when(() => mockSharedPreferences.remove(cacheLoginInfoKey))
          .thenAnswer((_) async => true);

      // Act
      final result = await authLocalDataSource.removeLoginInfo();

      // Assert
      expect(result, true);
    });

    test('should return false when loginInfo removal fails', () async {
      when(() => mockSharedPreferences.remove(cacheLoginInfoKey))
          .thenAnswer((_) async => false);

      final result = await authLocalDataSource.removeLoginInfo();

      expect(result, false);
    });
  });
}
