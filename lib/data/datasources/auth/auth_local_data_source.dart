import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_clean_flutter_todo/core/constant/shared_key.dart';
import 'package:tdd_clean_flutter_todo/data/models/login_info_model.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveLoginInfo(LoginInfoModel loginInfo);
  Future<LoginInfoModel?> getLoginInfo();
  Future<bool> removeLoginInfo();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  Future<bool> _cacheData(String key, String value) async {
    try {
      return await sharedPreferences.setString(key, value);
    } catch (e) {
      return false;
    }
  }

  String? _getSavedData(String key) {
    try {
      return sharedPreferences.getString(key);
    } catch (e) {
      return null;
    }
  }

  Future<bool> _removeData(String key) async {
    try {
      return await sharedPreferences.remove(key);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveLoginInfo(LoginInfoModel loginInfo) async {
    return _cacheData(cacheLoginInfoKey, json.encode(loginInfo.toJson()));
  }

  @override
  Future<LoginInfoModel?> getLoginInfo() async {
    final result = _getSavedData(cacheLoginInfoKey);

    if (result != null) {
      return LoginInfoModel.fromJson(json.decode(result));
    }

    return null;
  }

  @override
  Future<bool> removeLoginInfo() async {
    return await _removeData(cacheLoginInfoKey);
  }
}
