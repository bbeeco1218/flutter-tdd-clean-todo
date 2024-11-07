import 'package:equatable/equatable.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/user.dart';

class UserModel extends Equatable {
  final String idx;
  final String name;
  final String email;

  const UserModel({
    required this.idx,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'idx': idx,
        'name': name,
        'email': email,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idx: json['idx'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
      );

  factory UserModel.fromEntity(User user) => UserModel(
        idx: user.idx,
        name: user.name,
        email: user.email,
      );

  User toEntity() => User(
        idx: idx,
        name: name,
        email: email,
      );

  @override
  List<Object?> get props => [idx];
}
