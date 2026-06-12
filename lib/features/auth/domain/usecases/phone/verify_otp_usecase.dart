// features/auth/domain/usecases/phone/verify_otp_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';
import 'package:education_live_app/features/auth/domain/repositories/phone_auth_repository.dart';
import 'package:equatable/equatable.dart';

class VerifyOTPUseCase extends UseCase<UserEntity, VerifyOTPParams> {
  final PhoneAuthRepository repository;

  VerifyOTPUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(VerifyOTPParams params) {
    return repository.verifyOTP(
      phoneNumber: params.phoneNumber,
      otpCode: params.otpCode,
    );
  }
}

class VerifyOTPParams extends Equatable {
  final String phoneNumber;
  final String otpCode;

  const VerifyOTPParams({
    required this.phoneNumber,
    required this.otpCode,
  });

  @override
  List<Object> get props => [phoneNumber, otpCode];
}