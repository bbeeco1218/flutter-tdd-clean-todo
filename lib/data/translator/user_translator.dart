import 'package:tdd_clean_flutter_todo/data/models/user_model.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/user.dart';

extension UserModelMapper on UserModel {
  User toEntity() {
    return User(
      idx: idx,
      name: name,
      email: email,
    );
  }
}

extension UserMapper on User {
  UserModel toModel() {
    return UserModel(
      idx: idx,
      name: name,
      email: email,
    );
  }
}
