import 'package:dartz/dartz.dart';
import 'package:education_live_app/core/error/failures.dart';
import 'package:education_live_app/core/usecase/base_usecase.dart';
import 'package:education_live_app/features/auth/domain/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';

class UploadProfilePictureUseCase
    extends UseCase<String, UploadProfilePictureParams> {
  final ProfileRepository repository;

  UploadProfilePictureUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(UploadProfilePictureParams params) {
    return repository.uploadProfilePicture(filePath: params.filePath);
  }
}

class UploadProfilePictureParams extends Equatable {
  final String filePath;

  const UploadProfilePictureParams({required this.filePath});

  @override
  List<Object> get props => [filePath];
}