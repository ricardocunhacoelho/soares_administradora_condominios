import 'package:soares_administradora_condominios/delivery_received/domain/entity/delivery.received.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/single_notification/domain/entity/single.notification.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';
import 'package:soares_administradora_condominios/user/domain/entity/user.entity.dart';

class MyHouseResidentModel extends ResidentEntity {
  MyHouseResidentModel({
    required String id,
    required String name,
    required DateTime bornDate,
    required String cpf,
    required String phoneNumber,
    required String email,
    required String? profileImage,
    required String? profileImageThumb,
    required String picture,
    required EUserType userType,
    required List<SingleNotificationEntity> notifications,
    required bool access,
    required UnitEntity unit,
    required String homeUnitEntity,
    required List<DeliveryReceivedEntity> deliveriesReceived,
  }) : super(
          id: id,
          name: name,
          cpf: cpf,
          userType: userType,
          email: email,
          bornDate: bornDate,
          phoneNumber: phoneNumber,
          profileImage: profileImage,
          profileImageThumb: profileImageThumb,
          picture: picture,
          notifications: notifications,
          access: access,
          unit: unit,
          homeUnitEntity: homeUnitEntity,
          deliveriesReceived: deliveriesReceived,
        );

  factory MyHouseResidentModel.empty() => MyHouseResidentModel(
        id: '',
        name: '',
        cpf: '',
        userType: EUserType.resident,
        email: '',
        bornDate: DateTime(0, 0, 0),
        phoneNumber: '',
        profileImage: '',
        profileImageThumb: '',
        picture: '',
        notifications: [],
        access: false,
        unit: UnitEntity(id: '', block: '', number: 0),
        homeUnitEntity: '',
        deliveriesReceived: [],
      );
  MyHouseResidentModel copyWith({
    String? id,
    String? name,
    DateTime? bornDate,
    String? cpf,
    String? phoneNumber,
    String? email,
    String? profileImage,
    String? profileImageThumb,
    String? picture,
    EUserType? userType,
    List<SingleNotificationEntity>? notifications,
    bool? access,
    UnitEntity? unit,
    String? homeUnitEntity,
    List<DeliveryReceivedEntity>? deliveriesReceived,
  }) {
    return MyHouseResidentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      userType: userType ?? this.userType,
      email: email ?? this.email,
      bornDate: bornDate ?? this.bornDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      profileImageThumb: profileImageThumb ?? this.profileImageThumb,
      picture: picture ?? this.picture,
      notifications: notifications ?? this.notifications,
      access: access ?? this.access,
      unit: unit ?? this.unit,
      homeUnitEntity: homeUnitEntity ?? this.homeUnitEntity,
      deliveriesReceived: deliveriesReceived ?? this.deliveriesReceived,
    );
  }

  factory MyHouseResidentModel.converter(ResidentEntity resident) =>
      MyHouseResidentModel(
        id: resident.id,
        name: resident.name,
        cpf: resident.cpf,
        userType: resident.userType,
        email: resident.email,
        bornDate: resident.bornDate,
        phoneNumber: resident.phoneNumber,
        profileImage: resident.profileImage,
        profileImageThumb: resident.profileImageThumb,
        picture: resident.picture,
        notifications: resident.notifications,
        access: resident.access,
        unit: resident.unit,
        homeUnitEntity: resident.homeUnitEntity,
        deliveriesReceived: resident.deliveriesReceived,
      );
}
