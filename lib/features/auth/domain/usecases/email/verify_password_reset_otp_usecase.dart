import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';
import 'package:education_live_app/features/auth/domain/repositories/email_auth_repository.dart';
import 'package:equatable/equatable.dart';

class VerifyPasswordResetOtpUseCase
    extends UseCase<UserEntity, VerifyPasswordResetOtpParams> {
  final EmailAuthRepository repository;

  VerifyPasswordResetOtpUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(
    VerifyPasswordResetOtpParams params,
  ) {
    return repository.verifyPasswordRestOtp(
      email: params.email,
      otp: params.otp,
    );
  }
}

class VerifyPasswordResetOtpParams extends Equatable {
  final String email;
  final String otp;

  const VerifyPasswordResetOtpParams({
    required this.email,
    required this.otp,
  });

  @override
  List<Object> get props => [email, otp];
}