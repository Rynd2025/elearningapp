import 'package:elearningapp_frontend/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  // Convertit le JSON de votre API Express en UserModel
  // Adapté au format standard de MongoDB (_id)
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }

  // Convertit le UserModel en Map (utile pour les requêtes POST si besoin)
  Map<String, dynamic> toJson() {
    return {'_id': id, 'email': email, 'name': name};
  }
}
