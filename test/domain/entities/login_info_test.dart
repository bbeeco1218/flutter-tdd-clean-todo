import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_flutter_todo/domain/entities/login_info.dart';

import '../../helpers/test_constants/test_constants.dart';

void main() {
  test(
    'should type of LoginInfo',
    () async {
      // assert
      expect(tLoginInfo, isA<LoginInfo>());
    },
  );
}
