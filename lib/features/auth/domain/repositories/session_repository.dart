
import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';

abstract class SessionRepository {
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, void>> signOut();
  Stream<UserEntity?> get authStateChanges;
}
