import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/widgets/bese_test_widget.dart';
import 'package:simply_shop/pages/course/courese_detail_controller.dart';
import 'package:simply_shop/pages/course/widgets/course_detail.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: courseBuildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    thumbNail(),
                    SizedBox(
                      height: 15.h,
                    ),
                    menuView(),
                    SizedBox(
                      height: 15.h,
                    ),
                    baseReusableText('Course Description'),
                    SizedBox(
                      height: 15.h,
                    ),
                    descriptionText(),
                    SizedBox(
                      height: 20.h,
                    ),
                    goBuyButton('go Buy'),
                    SizedBox(
                      height: 20.h,
                    ),
                    courseSummary(),
                    SizedBox(
                      height: 15.h,
                    ),
                    courseBuildListView(context),
                    SizedBox(
                      height: 15.h,
                    ),
                    baseReusableText('Lesson List'),
                    SizedBox(
                      height: 15.h,
                    ),
                    courseLessonList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }
}
