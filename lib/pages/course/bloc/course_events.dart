import 'package:simply_shop/common/entities/course.dart';

abstract class CourseEvents {
  const CourseEvents();
}

class TriggerCourse extends CourseEvents {
  final CourseItem courseItem;
  const TriggerCourse(this.courseItem) : super();
}
