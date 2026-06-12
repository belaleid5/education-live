import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/entities/user_entity.dart';
import 'package:education_live_app/features/auth/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateProfileUseCase extends UseCase<UserEntity, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UpdateProfileParams params) {
    return repository.updateProfile(
      name: params.name,
      avatarUrl: params.avatarUrl,
    );
  }
}

class UpdateProfileParams extends Equatable {
  final String? name;
  final String? avatarUrl;

  const UpdateProfileParams({
    this.name,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [name, avatarUrl];
}