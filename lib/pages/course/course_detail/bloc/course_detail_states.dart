import 'package:simply_shop/common/entities/course.dart';

class CourseDetailStates {
  final CourseItem? courseItem;
  const CourseDetailStates({this.courseItem});

  CourseDetailStates copyWith({CourseItem? courseItem}) {
    return CourseDetailStates(courseItem: courseItem ?? this.courseItem);
  }
}
