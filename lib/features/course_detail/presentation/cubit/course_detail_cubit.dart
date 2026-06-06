import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_detail_state.dart';

class CourseDetailCubit
    extends Cubit<CourseDetailState> {

  CourseDetailCubit()
      : super(CourseDetailInitial());
}
