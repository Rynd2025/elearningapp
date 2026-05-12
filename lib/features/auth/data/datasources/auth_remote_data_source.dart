import 'package:dio/dio.dart';
import 'package:elearningapp_frontend/core/error/failures.dart';
import 'package:elearningapp_frontend/features/auth/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  // On définit l'URL en tant que constante de classe ou variable externe
  static const String baseUrl = "http://10.0.2.2:3000/api";

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "$baseUrl/auth/login", // Utilisation propre de l'URL
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // response.data contient déjà le JSON parsé par Dio
        return UserModel.fromJson(response.data);
      } else {
        throw ServerFailure('Erreur lors de la connexion');
      }
    } on DioException catch (e) {
      // Plus précis pour capturer les erreurs réseau (401, 500, etc.)
      final errorMessage = e.response?.data['message'] ?? "Erreur serveur";
      throw ServerFailure(errorMessage);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
