import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';

class UserEntity {
  final String id;
  final String name;
  final DateTime bornDate;
  final String cpf;
  final String phoneNumber;
  final String email;
  final String? profileImage;
  final String picture;
  final EUserType userType;
  final List<SingleNotificationEntity> notifications;
  final bool access;
  UserEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.userType,
    required this.email,
    required this.bornDate,
    required this.phoneNumber,
    required this.profileImage,
    required this.picture,
    required this.notifications,
    required this.access,
  });
}

enum EUserType { workerCondominium, resident, visitor, houseServiceProvider }
