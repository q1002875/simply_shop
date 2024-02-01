import 'package:simply_shop/common/entities/entities.dart';
import 'package:simply_shop/common/utils/http_util.dart';

class CourseAPI {
  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/courseDetail', queryParameters: params?.toJson());
    print(response.toString());
    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> coursePay(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil()
        .post('api/checkout', queryParameters: params?.toJson());
    print("response url = ${response.toString()}");
    return BaseResponseEntity.fromJson(response);
  }
}
