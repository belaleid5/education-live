import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/exceptions.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/features/auth/data/datasources/social_auth_datasource.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';
import 'package:education_live_app/features/auth/domain/repositories/social_auth_repository.dart'; // ← أضفه
import 'package:supabase_flutter/supabase_flutter.dart';

class SocialAuthRepositoryImpl implements SocialAuthRepository {
  final SocialAuthDataSource socialAuthDataSource;

  SocialAuthRepositoryImpl({required this.socialAuthDataSource});

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await socialAuthDataSource.signInWithGoogle();
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

 

  @override
  Future<Either<Failure, UserEntity>> signInWithFaceBook() async {
    try {
      final user = await socialAuthDataSource.signInWithFaceBook();
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}