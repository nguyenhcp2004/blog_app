import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_app/core/secrets/app_secrets.dart';
import 'package:youtube_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:youtube_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:youtube_app/features/auth/domain/repository/auth_repository.dart';
import 'package:youtube_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:youtube_app/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  // Datasource
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    // Usecases
    ..registerFactory(() => UserSignUp(serviceLocator()))
    // Bloc
    ..registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator()));
}
