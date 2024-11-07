import 'package:tdd_clean_flutter_todo/data/models/login_info_model.dart';
import 'package:tdd_clean_flutter_todo/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> login(LoginInfoModel loginInfo);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel?> login(LoginInfoModel loginInfo) async {
    //실제 리모트 데이터소스가 아니기 때문에 임시로 1초 지연을 주고 로그인 성공시 유저 정보 반환
    await Future.delayed(const Duration(seconds: 1));

    if (loginInfo.id == 'id' && loginInfo.password == 'password') {
      return const UserModel(
          idx: 'abc1', name: 'Ricky Kim', email: 'abc@gamil.com');
    }

    return null;
  }
}
