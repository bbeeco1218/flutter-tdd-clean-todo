import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_flutter_todo/data/models/login_info_model.dart';

import '../../helpers/fixtures/fixture_reader.dart';
import '../../helpers/test_constants/test_constants.dart';

void main() {
  test('should subclass of LoginInfoModel', () {
    // assert
    expect(tLoginInfoModel, isA<LoginInfoModel>());
  });

  test('should return a valid model', () {
    // assert
    expect(tLoginInfoModel.id, 'id');
    expect(tLoginInfoModel.password, 'password');
  });

  test('should return a json map containing the proper data', () {
    // arrange
    final Map<String, dynamic> expectedMap =
        json.decode(fixture('login_info/login_info.json'));

    // act
    final Map<String, dynamic> result = tLoginInfoModel.toJson();

    // assert
    expect(result, expectedMap);
  });

  test('should return a model from json', () {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('login_info/login_info.json'));

    // act
    final result = LoginInfoModel.fromJson(jsonMap);

    // assert
    expect(result, tLoginInfoModel);
  });
}
