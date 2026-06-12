import 'package:education_live_app/core/network/supabase/auth_client.dart';
import 'package:education_live_app/core/network/supabase/auth_client_impl.dart';
import 'package:education_live_app/features/app/ui/app_cubit_cubit.dart';
import 'package:education_live_app/features/auth/data/datasources/email_auth_datasource.dart';
import 'package:education_live_app/features/auth/data/datasources/email_auth_datasource_impl.dart';
import 'package:education_live_app/features/auth/data/datasources/phone_auth_datasource.dart';
import 'package:education_live_app/features/auth/data/datasources/phone_auth_datasource_impl.dart';
import 'package:education_live_app/features/auth/data/datasources/profile_datasource.dart';
import 'package:education_live_app/features/auth/data/datasources/profile_datasource_impl.dart';
import 'package:education_live_app/features/auth/data/datasources/session_datasource.dart';
import 'package:education_live_app/features/auth/data/datasources/session_datasource_impl.dart';
import 'package:education_live_app/features/auth/data/datasources/social_auth_datasource.dart';
import 'package:education_live_app/features/auth/data/datasources/social_auth_datasource_impl.dart';
import 'package:education_live_app/features/auth/data/repositories/email_auth_repository_impl.dart';
import 'package:education_live_app/features/auth/data/repositories/phone_auth_repository_impl.dart';
import 'package:education_live_app/features/auth/data/repositories/profile_repository_impl.dart';
import 'package:education_live_app/features/auth/data/repositories/session_repository_impl.dart';
import 'package:education_live_app/features/auth/data/repositories/social_auth_repository_impl.dart';
import 'package:education_live_app/features/auth/domain/repositories/email_auth_repository.dart';
import 'package:education_live_app/features/auth/domain/repositories/phone_auth_repository.dart';
import 'package:education_live_app/features/auth/domain/repositories/profile_repository.dart';
import 'package:education_live_app/features/auth/domain/repositories/session_repository.dart';
import 'package:education_live_app/features/auth/domain/repositories/social_auth_repository.dart';
import 'package:education_live_app/features/auth/domain/usecases/email/reset_password_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/email/send_magic_link_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/email/update_password_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/email/verify_password_reset_otp_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/profile/delete_account_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/profile/update_profile_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/profile/upload_profile_picture_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/session/get_current_user_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/session/sign_out_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/social/sign_in_with_facebook_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/social/sign_in_with_google_usecase.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:education_live_app/features/auth/presentation/bloc/social_auth/social_auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> setupDI() async {
  sl.registerLazySingleton(() => Supabase.instance.client);

  sl.registerLazySingleton<AuthClient>(
    () => AuthClientImpl(sl(), ),
  );

  sl.registerLazySingleton<EmailAuthDataSource>(
    () => EmailAuthDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<SocialAuthDataSource>(
    () => SocialAuthDataSourceImpl( sl()),
  );


  sl.registerLazySingleton<PhoneAuthDataSource>(
    () => PhoneAuthDataSourceImpl( sl()),
  );

  sl.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSourceImpl( sl(),sl()),
  );

  sl.registerLazySingleton<SessionDataSource>(
    () => SessionDataSourceImpl( sl()),
  );

  sl.registerLazySingleton<EmailAuthRepository>(
    () => EmailAuthRepositoryImpl(emailAuthDataSource: sl()),
  );

  sl.registerLazySingleton<SocialAuthRepository>(
    () => SocialAuthRepositoryImpl(socialAuthDataSource: sl()),
  );

  sl.registerLazySingleton<PhoneAuthRepository>(
    () => PhoneAuthRepositoryImpl(  phoneAuthDataSource: sl()),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileDataSource: sl()),
  );

  sl.registerLazySingleton<SessionRepository>(
    () => SessionRepositoryImpl(sessionDataSource: sl()),
  );

  sl.registerLazySingleton(
    () => SignUpUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => LogInUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => SendMagicLinkUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => VerifyPasswordResetOtpUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => UpdatePasswordUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => SignInWithGoogleUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => SignInWithFacebookUseCase(sl()),
  );
sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  

  sl.registerLazySingleton(
    () => UpdateProfileUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => UploadProfilePictureUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => DeleteAccountUseCase(sl()),
  );


  sl.registerLazySingleton(
    () => GetCurrentUserUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => SignOutUseCase(sl()),
  );


  sl.registerFactory(
  () => EmailAuthBloc(
    signUpUseCase: sl(),
    signInUseCase: sl(),
    resetPasswordUseCase: sl(),
    verifyPasswordResetOtpUseCase: sl(),
    updatePasswordUseCase: sl(),
    sendMagicLinkUseCase: sl(),
  ),
);

  sl.registerFactory(
    () => SocialAuthBloc(socialAuthRepository: sl()
      
    ),
  );

  sl.registerFactory(() => AppCubit());
}