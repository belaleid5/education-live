import 'package:flutter_bloc/flutter_bloc.dart';
import 'messages_state.dart';

class MessagesCubit
    extends Cubit<MessagesState> {

  MessagesCubit()
      : super(MessagesInitial());
}
