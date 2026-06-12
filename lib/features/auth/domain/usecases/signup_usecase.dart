// features/auth/domain/usecases/email/sign_up_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';
import 'package:education_live_app/features/auth/domain/repositories/email_auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignUpUseCase extends UseCase<UserEntity, SignUpParams> {
  final EmailAuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) {
    return repository.signUpWithEmail(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String name;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}