class UserEntity {
  final String id;
  final EUserType userType;
  final String email;
  final String phoneNumber;
  UserEntity({
    required this.id,
    required this.userType,
    required this.email,
    required this.phoneNumber,
  });
}

enum EUserType { worker, homeUnit }
