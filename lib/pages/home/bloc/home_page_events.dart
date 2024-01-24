import 'package:simply_shop/common/entities/course.dart';

class HomePageCourseItem extends HomePageEvents {
  final List<CourseItem> courseItem;
  const HomePageCourseItem(this.courseItem);
}

class HomePageDots extends HomePageEvents {
  final int index;
  const HomePageDots(this.index) : super();
}

abstract class HomePageEvents {
  const HomePageEvents();
}
