import 'package:education_live_app/core/error/exceptions.dart';
import 'package:education_live_app/core/network/supabase/auth_client.dart';
import 'package:education_live_app/features/auth/data/datasources/social_auth_datasource.dart';
import 'package:education_live_app/features/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SocialAuthDataSourceImpl implements SocialAuthDataSource {
  final AuthClient _authClient;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance; 
  bool _isInitialized = false;

  SocialAuthDataSourceImpl(this._authClient);

  Future<void> _ensureInitialized() async {
    if (_isInitialized) return;

    await _googleSignIn.initialize(
      serverClientId: const String.fromEnvironment('GOOGLE_WEB_CLIENT_ID').isEmpty
          ? null
          : const String.fromEnvironment('GOOGLE_WEB_CLIENT_ID'),
    );
    _isInitialized = true;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      await _ensureInitialized();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken == null) {
        throw ServerException('Failed to get Google ID token');
      }

      final authResponse = await _authClient.signInWithIdToken(
        OAuthProvider.google,
        idToken,
      );

      if (authResponse.user == null) {
        throw ServerException('Failed to sign in with Google');
      }

      return UserModel.fromSupabaseUser(authResponse.user!);
    } on AuthException {
      rethrow;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in with Google: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signInWithApple() async {
    try {
      throw UnimplementedError('Apple sign-in not configured');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in with Apple: ${e.toString()}');
    }
  }



  @override
  Future<UserModel> signInWithFaceBook() async {
    try {
      throw UnimplementedError('Facebook sign-in not configured');
    } on AuthException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to sign in with Facebook: ${e.toString()}');
    }
  }
  

}