import 'package:education_live_app/features/auth/domain/usecases/email/reset_password_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/email/verify_password_reset_otp_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/email/update_password_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/email/send_magic_link_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:education_live_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_event.dart';
import 'package:education_live_app/features/auth/presentation/bloc/email_auth/email_auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAuthBloc extends Bloc<EmailAuthEvent, EmailAuthState> {
  final SignUpUseCase signUpUseCase;
  final LogInUseCase signInUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyPasswordResetOtpUseCase verifyPasswordResetOtpUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final SendMagicLinkUseCase sendMagicLinkUseCase;

  EmailAuthBloc({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.resetPasswordUseCase,
    required this.verifyPasswordResetOtpUseCase,
    required this.updatePasswordUseCase,
    required this.sendMagicLinkUseCase,
  }) : super(EmailAuthInitial()) {
    on<SignUpWithEmailEvent>(_onSignUpWithEmail);
    on<SignInWithEmailEvent>(_onSignInWithEmail);
    on<SendPasswordResetOtpEvent>(_onSendPasswordResetOtp);
    on<VerifyPasswordResetOtpEvent>(_onVerifyPasswordResetOtp);
    on<UpdatePasswordEvent>(_onUpdatePassword);
    on<SendMagicLinkEvent>(_onSendMagicLink);
  }

  Future<void> _onSignUpWithEmail(
    SignUpWithEmailEvent event,
    Emitter<EmailAuthState> emit,
  ) async {
    emit(EmailAuthLoading());

    final result = await signUpUseCase(
      SignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );

    result.fold(
      (failure) => emit(EmailAuthError(failure.message)),
      (user) => emit(EmailAuthSuccess(user)),
    );
  }

  Future<void> _onSignInWithEmail(
    SignInWithEmailEvent event,
    Emitter<EmailAuthState> emit,
  ) async {
    emit(EmailAuthLoading());

    final result = await signInUseCase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(EmailAuthError(failure.message)),
      (user) => emit(EmailAuthSuccess(user)),
    );
  }

  Future<void> _onSendPasswordResetOtp(
    SendPasswordResetOtpEvent event,
    Emitter<EmailAuthState> emit,
  ) async {
    emit(EmailAuthLoading());

    final result = await resetPasswordUseCase(
      ResetPasswordParams(email: event.email),
    );

    result.fold(
      (failure) => emit(EmailAuthError(failure.message)),
      (_) => emit(const PasswordResetOtpSent(
        'تم إرسال كود إعادة تعيين كلمة المرور إلى بريدك الإلكتروني',
      )),
    );
  }

  Future<void> _onVerifyPasswordResetOtp(
    VerifyPasswordResetOtpEvent event,
    Emitter<EmailAuthState> emit,
  ) async {
    emit(EmailAuthLoading());

    final result = await verifyPasswordResetOtpUseCase(
      VerifyPasswordResetOtpParams(
        email: event.email,
        otp: event.otp,
      ),
    );

    result.fold(
      (failure) => emit(EmailAuthError(failure.message)),
      (user) => emit(PasswordResetOtpVerified()),
    );
  }

  Future<void> _onUpdatePassword(
    UpdatePasswordEvent event,
    Emitter<EmailAuthState> emit,
  ) async {
    emit(EmailAuthLoading());

    final result = await updatePasswordUseCase(
      UpdatePasswordParams(password: event.password),
    );

    result.fold(
      (failure) => emit(EmailAuthError(failure.message)),
      (_) => emit(PasswordUpdated()),
    );
  }

  Future<void> _onSendMagicLink(
    SendMagicLinkEvent event,
    Emitter<EmailAuthState> emit,
  ) async {
    emit(EmailAuthLoading());

    final result = await sendMagicLinkUseCase(
      SendMagicLinkParams(email: event.email),
    );

    result.fold(
      (failure) => emit(EmailAuthError(failure.message)),
      (_) => emit(const MagicLinkSent(
        'تم إرسال رابط تسجيل الدخول إلى بريدك الإلكتروني',
      )),
    );
  }
}