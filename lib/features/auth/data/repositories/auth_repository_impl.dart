import 'package:fpdart/fpdart.dart';
import 'package:youtube_app/core/common/entities/user.dart';
import 'package:youtube_app/core/error/exception.dart';
import 'package:youtube_app/core/error/failures.dart';
import 'package:youtube_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:youtube_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
