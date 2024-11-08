import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_flutter_todo/data/translator/login_info_translator.dart';

import '../../helpers/test_constants/test_constants.dart';

void main() {
  test('should return a model from entity', () {
    // act
    final result = tLoginInfo.toModel();

    // assert
    expect(result, tLoginInfoModel);
  });

  test('should return an entity from model', () {
    // act
    final result = tLoginInfoModel.toEntity();

    // assert
    expect(result, tLoginInfo);
  });
}
