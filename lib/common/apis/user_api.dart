import 'package:simply_shop/common/entities/entities.dart';
import 'package:simply_shop/common/utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    print('params = ${params?.toJson()}');
    var response =
        await HttpUtil().post('api/login', queryParameters: params?.toJson());
    print('api response ${response.toString()}');
    return UserLoginResponseEntity.fromJson(response);
  }
}
