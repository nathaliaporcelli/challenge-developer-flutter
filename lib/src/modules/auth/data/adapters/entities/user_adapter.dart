import '../../../domain/entities/user_entity.dart';

class UserAdapter {
  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: int.parse(map['id']),
      email: map['email'],
      token: map['token'],
    );
  }
}
