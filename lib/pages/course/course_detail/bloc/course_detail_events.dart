import 'package:simply_shop/common/entities/course.dart';

abstract class CourseDetailEvents {
  const CourseDetailEvents();
}

class TriggerCourseDetail extends CourseDetailEvents {
  final CourseItem courseItem;
  const TriggerCourseDetail(this.courseItem) : super();
}
