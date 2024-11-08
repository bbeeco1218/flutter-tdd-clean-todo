import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_flutter_todo/data/translator/user_translator.dart';

import '../../helpers/test_constants/test_constants.dart';

void main() {
  test(
    'should return a model from entity',
    () async {
      // act
      final result = tUser.toModel();

      // assert
      expect(result, tUserModel);
    },
  );

  test(
    'should return an entity from model',
    () async {
      // act
      final result = tUserModel.toEntity();

      // assert
      expect(result, tUser);
    },
  );
}
