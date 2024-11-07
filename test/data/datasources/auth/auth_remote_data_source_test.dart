import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_flutter_todo/data/datasources/auth/auth_remote_data_source.dart';
import 'package:tdd_clean_flutter_todo/data/models/login_info_model.dart';

import '../../../helpers/test_constants/test_constants.dart';

void main() {
  late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;

  setUp(() {
    authRemoteDataSourceImpl = AuthRemoteDataSourceImpl();
  });

  group('login', () {
    test('should return LoginInfo when login success', () async {
      // Act
      final result = await authRemoteDataSourceImpl.login(tLoginInfoModel);

      // Assert
      expect(result, tUserModel);
    });

    test('should return failure when login fails', () async {
      // Act
      final result = await authRemoteDataSourceImpl
          .login(const LoginInfoModel(id: 'abc', password: '123'));

      // Assert
      expect(result, null);
    });
  });
}
