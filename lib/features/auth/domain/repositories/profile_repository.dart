
import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity>> updateProfile({String? name, String? avatarUrl});
  Future<Either<Failure, String>> uploadProfilePicture({required String filePath});
  Future<Either<Failure, void>> deleteAccount();
}
