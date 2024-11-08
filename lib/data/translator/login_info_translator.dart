import 'package:tdd_clean_flutter_todo/data/models/login_info_model.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';

extension LoginInfoModelMapper on LoginInfoModel {
  LoginInfo toEntity() {
    return LoginInfo(
      id: id,
      password: password,
    );
  }
}

extension LoginInfoMapper on LoginInfo {
  LoginInfoModel toModel() {
    return LoginInfoModel(
      id: id,
      password: password,
    );
  }
}
