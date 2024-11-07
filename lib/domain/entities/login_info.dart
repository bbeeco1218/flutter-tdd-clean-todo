import 'package:equatable/equatable.dart';

class LoginInfo extends Equatable {
  final String id;
  final String password;

  const LoginInfo({
    required this.id,
    required this.password,
  });

  @override
  List<Object?> get props => [
        id,
        password,
      ];
}
