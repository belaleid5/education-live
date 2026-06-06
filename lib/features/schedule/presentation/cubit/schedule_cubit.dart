import 'package:flutter_bloc/flutter_bloc.dart';
import 'schedule_state.dart';

class ScheduleCubit
    extends Cubit<ScheduleState> {

  ScheduleCubit()
      : super(ScheduleInitial());
}
