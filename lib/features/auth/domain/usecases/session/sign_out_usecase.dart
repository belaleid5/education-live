import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/repositories/session_repository.dart';

class SignOutUseCase extends UseCaseNoParams<void> {
  final SessionRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() {
    return repository.signOut();
  }
}