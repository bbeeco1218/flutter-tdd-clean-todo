import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_flutter_todo/core/error/failure.dart';
import 'package:tdd_clean_flutter_todo/core/usecases/usecase.dart';
import 'package:tdd_clean_flutter_todo/domain/usecases/save_login_info_usecase.dart';

import '../../helpers/test_constants/test_constants.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late SaveLoginInfoUsecase saveLoginInfoUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    saveLoginInfoUsecase = SaveLoginInfoUsecase(repository: mockAuthRepository);
  });

  group('SaveLoginInfoUsecase', () {
    test('should save login info', () async {
      // Arrange
      when(() => mockAuthRepository.saveLoginInfo(tLoginInfo))
          .thenAnswer((_) async => true);

      // Act
      final result = await saveLoginInfoUsecase(tLoginInfo);

      // Assert
      result.fold(
        (failure) => null,
        (success) => expect(success, NoParams()),
      );
      verify(() => mockAuthRepository.saveLoginInfo(tLoginInfo));
    });

    test('should return failure when save login info fails', () async {
      // Arrange
      when(() => mockAuthRepository.saveLoginInfo(tLoginInfo))
          .thenAnswer((_) async => false);

      // Act
      final result = await saveLoginInfoUsecase(tLoginInfo);

      // Assert
      result.fold(
        (failure) => expect(failure, LocalFailure('Failed to save login info')),
        (success) => null,
      );
      verify(() => mockAuthRepository.saveLoginInfo(tLoginInfo));
    });
  });
}
