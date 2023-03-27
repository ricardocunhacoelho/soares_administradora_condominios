import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';

abstract class MyHouseEvents {}

class UpdateValueUserUsecaseMyHouseEvent implements MyHouseEvents {
  final String library;
  final dynamic data;
  UpdateValueUserUsecaseMyHouseEvent(this.library, this.data);
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
