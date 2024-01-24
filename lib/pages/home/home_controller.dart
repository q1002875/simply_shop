import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/common/apis/course_api.dart';
import 'package:simply_shop/common/entities/user.dart';
import 'package:simply_shop/global.dart';
import 'package:simply_shop/pages/home/bloc/home_page_blocs.dart';
import 'package:simply_shop/pages/home/bloc/home_page_events.dart';

class HomeController {
  static final HomeController _singleton = HomeController._external();
  late BuildContext context;
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }
  HomeController._external();
  UserItem get userProfile => Global.storageService.getUserProfile();
  // HomeController({required this.context});

  Future<void> init() async {
    ///make sure user logged
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        //  目前是否與此上下文關聯的 [Widget] 安裝在小部件樹中。
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
      } else {
        print(result.code);
      }
    } else {
      print('user has already logged out');
    }
  }
}
