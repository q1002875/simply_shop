import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simply_shop/common/apis/course_api.dart';
import 'package:simply_shop/common/entities/course.dart';
import 'package:simply_shop/common/routes/names.dart';
import 'package:simply_shop/common/widgets/flutter_toast.dart';
import 'package:simply_shop/pages/course/course_detail/bloc/course_detail_blocs.dart';

import 'bloc/course_detail_events.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({required this.context});

  asyncLoadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();

    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    print('result code = ${result.code}');
    if (result.code == 200) {
      if (context.mounted) {
        print('result.data!${result.data!}');
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        print('------context is not available');
      }
    } else {
      toastInfo(msg: "something went wrong");
      print("----------error");
    }
  }

  Future<void> goBuy(int? id) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      print("buy url ${url.toString()}");
      await Navigator.of(context)
          .pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {"url": url});
    }
  }

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["id"]);
    await asyncLoadAllData(args["id"]);
  }
}
