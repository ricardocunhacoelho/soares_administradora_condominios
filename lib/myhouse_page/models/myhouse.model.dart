import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/unit/domain/entity/unit.entity.dart';

class MyHouseResidentModel extends ResidentEntity {
  MyHouseResidentModel({
    required String email,
    required String id,
    required String phoneNumber,
    required String name,
    required String picture,
    required String cpf,
    required DateTime bornDate,
    required UnitEntity unit,
  }) : super(
          id: id,
          email: email,
          phoneNumber: phoneNumber,
          name: name,
          picture: picture,
          cpf: cpf,
          bornDate: bornDate,
          unit: unit,
        );

  factory MyHouseResidentModel.empty() => MyHouseResidentModel(
        id: '',
        email: '',
        phoneNumber: '',
        name: '',
        picture: '',
        cpf: '',
        bornDate: DateTime.now(),
        unit: UnitEntity(id: '', qrid: '', block: '', number: 0),
      );
  MyHouseResidentModel copyWith({
    String? id,
    String? email,
    String? phoneNumber,
    String? name,
    String? picture,
    String? cpf,
    DateTime? bornDate,
    UnitEntity? unit,
  }) {
    return MyHouseResidentModel(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      cpf: cpf ?? this.cpf,
      bornDate: bornDate ?? this.bornDate,
      unit: unit ?? this.unit,
    );
  }

  factory MyHouseResidentModel.converter(ResidentEntity resident) =>
      MyHouseResidentModel(
          id: resident.id,
          email: resident.email,
          phoneNumber: resident.phoneNumber,
          name: resident.name,
          picture: resident.picture,
          cpf: resident.cpf,
          bornDate: resident.bornDate,
          unit: resident.unit);
}
