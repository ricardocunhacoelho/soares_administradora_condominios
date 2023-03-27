
import 'package:soares_administradora_condominios/user/domain/valueobjects/profile.image.object.value.dart';

class UserEntity {
  final String id;
  final EUserType userType;
  final String email;
  final String phoneNumber;
  final String? profileImage;
  UserEntity({
    required this.id,
    required this.userType,
    required this.email,
    required this.phoneNumber,
    required this.profileImage,
  });
}

enum EUserType { worker, homeUnit }
