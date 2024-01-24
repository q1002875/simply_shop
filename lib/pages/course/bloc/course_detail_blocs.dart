import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/course/bloc/course_detail_events.dart';
import 'package:simply_shop/pages/course/bloc/course_detail_states.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvents, CourseDetailStates> {
  CourseDetailBloc() : super(const CourseDetailStates()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
