import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_flutter_todo/data/models/user_model.dart';

import '../../helpers/fixtures/fixture_reader.dart';
import '../../helpers/test_constants/test_constants.dart';

void main() {
  test(
    'should type of UserModel',
    () async {
      // assert
      expect(tUserModel, isA<UserModel>());
    },
  );

  test(
    'should return a valid model',
    () async {
      // assert
      expect(tUserModel.idx, 'abc1');
      expect(tUserModel.name, 'Ricky Kim');
      expect(tUserModel.email, 'abc@gmail.com');
    },
  );

  test(
    'should return a json map containing the proper data',
    () async {
      // arrange
      final Map<String, dynamic> expectedMap = json.decode(
        fixture('user/user.json'),
      );

      // act
      final Map<String, dynamic> result = tUserModel.toJson();

      // assert
      expect(result, expectedMap);
    },
  );

  test(
    'should return a model from json',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(
        fixture('user/user.json'),
      );

      // act
      final result = UserModel.fromJson(jsonMap);

      // assert
      expect(result, tUserModel);
    },
  );

  test(
    'should return a model from entity',
    () async {
      // act
      final result = UserModel.fromEntity(tUser);

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
