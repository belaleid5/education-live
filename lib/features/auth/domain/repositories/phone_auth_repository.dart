
import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';

abstract class PhoneAuthRepository {
  Future<Either<Failure, void>> sendOTP({required String phoneNumber});
  Future<Either<Failure, UserEntity>> verifyOTP({required String phoneNumber, required String otpCode});
}
