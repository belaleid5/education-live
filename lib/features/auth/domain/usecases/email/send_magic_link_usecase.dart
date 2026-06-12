import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/repositories/email_auth_repository.dart';
import 'package:equatable/equatable.dart';

class SendMagicLinkUseCase extends UseCase<void, SendMagicLinkParams> {
  final EmailAuthRepository repository;

  SendMagicLinkUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendMagicLinkParams params) {
    return repository.sendMagicLink(email: params.email);
  }
}

class SendMagicLinkParams extends Equatable {
  final String email;

  const SendMagicLinkParams({required this.email});

  @override
  List<Object> get props => [email];
}