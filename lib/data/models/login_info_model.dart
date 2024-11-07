import 'package:equatable/equatable.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';

class LoginInfoModel extends Equatable {
  const LoginInfoModel({
    required this.id,
    required this.password,
  });

  final String id;
  final String password;

  Map<String, dynamic> toJson() => {
        'id': id,
        'password': password,
      };

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) => LoginInfoModel(
        id: json['id'] as String,
        password: json['password'] as String,
      );

  factory LoginInfoModel.fromEntity(LoginInfo loginInfo) => LoginInfoModel(
        id: loginInfo.id,
        password: loginInfo.password,
      );

  LoginInfo toEntity() => LoginInfo(
        id: id,
        password: password,
      );

  @override
  List<Object?> get props => [
        id,
        password,
      ];
}
