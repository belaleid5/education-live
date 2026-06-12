import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/repositories/phone_auth_repository.dart';
import 'package:equatable/equatable.dart';

class SendOTPUseCase extends UseCase<void, SendOTPParams> {
  final PhoneAuthRepository repository;

  SendOTPUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendOTPParams params) {
    return repository.sendOTP(phoneNumber: params.phoneNumber);
  }
}

class SendOTPParams extends Equatable {
  final String phoneNumber;

  const SendOTPParams({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}