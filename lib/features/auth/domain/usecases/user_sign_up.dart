import 'package:fpdart/fpdart.dart';
import 'package:youtube_app/core/common/entities/user.dart';
import 'package:youtube_app/core/error/failures.dart';
import 'package:youtube_app/core/usecase/usecase.dart';
import 'package:youtube_app/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository repository;

  const UserSignUp(this.repository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await repository.signUpWithEmailPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
