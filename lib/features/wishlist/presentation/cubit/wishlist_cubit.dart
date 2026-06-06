import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_state.dart';

class WishlistCubit
    extends Cubit<WishlistState> {

  WishlistCubit()
      : super(WishlistInitial());
}
