import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';
import 'package:education_live_app/features/auth/domain/repositories/session_repository.dart';

class GetCurrentUserUseCase extends UseCaseNoParams<UserEntity?> {
  final SessionRepository repository;

  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call() {
    return repository.getCurrentUser();
  }
}