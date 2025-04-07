import 'package:fpdart/fpdart.dart';
import 'package:youtube_app/core/common/entities/user.dart';
import 'package:youtube_app/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}
