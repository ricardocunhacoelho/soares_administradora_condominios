import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

abstract class MyHouseEvents {}

class UpdateValueUserMyHouseEvent implements MyHouseEvents {
  final String library;
  final dynamic data;
  UpdateValueUserMyHouseEvent(this.library, this.data);
}

class AddProfileImageMyHouseEvent implements MyHouseEvents {
  AddProfileImageMyHouseEvent();
}

class ChangeProfileImageMyHouseEvent implements MyHouseEvents {
  final String ref;
  ChangeProfileImageMyHouseEvent(this.ref);
}

class RegisterResidentMyHouseEvent implements MyHouseEvents {
  final ResidentEntity resident;
  RegisterResidentMyHouseEvent(this.resident);
}

class UpdateValueResidentMyHouseEvent implements MyHouseEvents {
final ResidentEntity residentEntity;
final int index;
  UpdateValueResidentMyHouseEvent(this.residentEntity, this.index);
}

class DeleteResidentMyHouseEvent implements MyHouseEvents {
final String cpf;
final int index;
  DeleteResidentMyHouseEvent(this.cpf, this.index);
}