import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

class WorkerEntity implements UserEntity {
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
  final EFunctionWorkerEntity function;
  final bool access;
  WorkerEntity({
    required this.id,
    required this.name,
    required this.bornDate,
    required this.cpf,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
    required this.picture,
    required this.userType,
    required this.notifications,
    required this.function,
    required this.access,
  });
}

enum EFunctionWorkerEntity { sindico, recepcionista, porteiro, zelador }
