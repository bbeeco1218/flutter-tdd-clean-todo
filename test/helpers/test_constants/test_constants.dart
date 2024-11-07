import 'package:tdd_clean_flutter_todo/data/models/login_info_model.dart';
import 'package:tdd_clean_flutter_todo/data/models/user_model.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/user.dart';

const String tSavedId = 'id';
const String tSavedPassword = 'password';
const LoginInfoModel tLoginInfoModel =
    LoginInfoModel(id: tSavedId, password: tSavedPassword);
const LoginInfo tLoginInfo = LoginInfo(id: tSavedId, password: tSavedPassword);

const String tUserIdx = 'abc1';
const String tUserName = 'Ricky Kim';
const String tUserEmail = 'abc@gmail.com';
const UserModel tUserModel = UserModel(
  idx: tUserIdx,
  name: tUserName,
  email: tUserEmail,
);
const User tUser = User(
  idx: tUserIdx,
  name: tUserName,
  email: tUserEmail,
);
