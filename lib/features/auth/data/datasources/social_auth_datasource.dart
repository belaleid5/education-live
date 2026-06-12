
import 'package:education_live_app/features/auth/data/models/user_model.dart';

abstract class SocialAuthDataSource {
  Future<UserModel> signInWithGoogle();
   Future<UserModel> signInWithFaceBook();
}
