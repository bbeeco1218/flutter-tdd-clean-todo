import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [
        id,
        password,
      ];
}
