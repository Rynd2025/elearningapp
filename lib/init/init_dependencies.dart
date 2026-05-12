import 'package:elearningapp_frontend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:elearningapp_frontend/features/auth/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:elearningapp_frontend/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:elearningapp_frontend/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:elearningapp_frontend/features/auth/domain/repositories/auth_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // 1. Client HTTP (Dio)
  serviceLocator.registerLazySingleton(() => Dio());

  // 2. Feature Auth
  // DataSource
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceLocator()),
  );

  // Repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  // UseCase
  serviceLocator.registerFactory(() => LoginUseCase(serviceLocator()));
  // À ajouter dans votre fonction initDependencies()
  serviceLocator.registerFactory(
    () => AuthBloc(loginUseCase: serviceLocator()),
  );
}
