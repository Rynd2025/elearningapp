import 'package:dartz/dartz.dart';
import 'package:elearningapp_frontend/core/error/failures.dart';
import 'package:elearningapp_frontend/features/auth/domain/entities/user_entity.dart';
import 'package:elearningapp_frontend/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

// Une classe simple pour passer les paramètres proprement
class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
