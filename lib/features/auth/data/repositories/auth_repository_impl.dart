import 'package:dartz/dartz.dart';
import 'package:elearningapp_frontend/core/error/failures.dart';
import 'package:elearningapp_frontend/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:elearningapp_frontend/features/auth/domain/entities/user_entity.dart';
import 'package:elearningapp_frontend/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(userModel); // Succès : on renvoie l'utilisateur
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message)); // Échec : erreur serveur
    } catch (e) {
      return Left(ServerFailure(e.toString())); // Échec : erreur inconnue
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  }) {
    // À implémenter plus tard pour l'inscription
    throw UnimplementedError();
  }
}
