import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';

abstract class SocialAuthRepository {
  Future<Either<Failure, UserEntity>> signInWithGoogle();  
  Future<Either<Failure, UserEntity>> signInWithFaceBook(); 
}