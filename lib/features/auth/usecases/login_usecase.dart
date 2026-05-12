import 'package:dartz/dartz.dart';
import 'package:elearningapp_frontend/core/error/failures.dart';
import 'package:elearningapp_frontend/features/auth/domain/entities/user_entity.dart';
import 'package:elearningapp_frontend/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  // La méthode 'call' permet d'appeler la classe comme une fonction
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

// Classe pour regrouper les paramètres de connexion
class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
