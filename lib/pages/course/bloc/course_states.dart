import 'package:simply_shop/common/entities/course.dart';

class CourseStates {
  final CourseItem? courseItem;
  const CourseStates({this.courseItem});

  CourseStates copyWith({CourseItem? courseItem}) {
    return CourseStates(courseItem: courseItem ?? this.courseItem);
  }
}
