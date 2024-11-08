import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [idx];
}
