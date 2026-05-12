import 'package:dio/dio.dart';
import 'package:elearningapp_frontend/core/error/failures.dart';
import 'package:elearningapp_frontend/features/auth/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'http://localhost:3000/api/login', // Assurez-vous que votre API Express tourne ici
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerFailure('Erreur lors de la connexion');
      }
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
