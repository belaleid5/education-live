// features/auth/domain/usecases/social/sign_in_with_google_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';
import 'package:education_live_app/features/auth/domain/repositories/social_auth_repository.dart';

class SignInWithGoogleUseCase extends UseCaseNoParams<UserEntity> {
  final SocialAuthRepository repository;

  SignInWithGoogleUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call() {
    return repository.signInWithGoogle();
  }
}