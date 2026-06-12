import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/repositories/email_auth_repository.dart';
import 'package:equatable/equatable.dart';

class UpdatePasswordUseCase extends UseCase<void, UpdatePasswordParams> {
  final EmailAuthRepository repository;

  UpdatePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdatePasswordParams params) {
    return repository.updatePassword(password: params.password);
  }
}

class UpdatePasswordParams extends Equatable {
  final String password;

  const UpdatePasswordParams({required this.password});

  @override
  List<Object> get props => [password];
}