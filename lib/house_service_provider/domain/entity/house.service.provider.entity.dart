import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

class HouseServiceProviderEntity implements UserEntity {
  final String id;
  final String name;
  final DateTime bornDate;
  final String cpf;
  final String phoneNumber;
  final String email;
  final String? profileImage;
  final String? profileImageThumb;
  final String picture;
  final EUserType userType;
  final List<SingleNotificationEntity> notifications;
  final bool access;
  final UnitEntity unit;
  final EtypeService typeService;
  final bool recurringService;
  final DateTime startWorkDate;
  final DateTime workStartTimeDay;
  final DateTime endOfWorkTimeDay;
  final DateTime? finishWorkDate;
  HouseServiceProviderEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.userType,
    required this.email,
    required this.bornDate,
    required this.phoneNumber,
    required this.profileImage,
    required this.profileImageThumb,
    required this.picture,
    required this.notifications,
    required this.access,
    required this.unit,
    required this.typeService,
    required this.recurringService,
    required this.startWorkDate,
    required this.workStartTimeDay,
    required this.endOfWorkTimeDay,
    this.finishWorkDate,
  });
}

enum EtypeService { masonry, woodwork, network, cleaning, security }
