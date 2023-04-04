import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/vehicle/domain/entity/vehicle.entity.dart';

abstract class MyHouseEvents {}

abstract class FetchEvents {}

class UpdateValueUserMyHouseEvent implements MyHouseEvents {
  final String library;
  final String key;
  final dynamic data;
  UpdateValueUserMyHouseEvent(this.library, this.key, this.data);
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

class RegisterVehicleMyHouseEvent implements MyHouseEvents {
  final VehicleEntity vehicle;
  final String idUnit;
  RegisterVehicleMyHouseEvent(this.vehicle, this.idUnit);
}

class UpdateValueResidentMyHouseEvent implements MyHouseEvents {
  final ResidentEntity residentEntity;
  final int index;
  UpdateValueResidentMyHouseEvent(this.residentEntity, this.index);
}

class DeleteResidentMyHouseEvent implements MyHouseEvents {
  final ResidentEntity resident;
  DeleteResidentMyHouseEvent(this.resident);
}

class FetchHomeUnitFetchEvents implements FetchEvents {
  final String id;

  FetchHomeUnitFetchEvents(this.id);
}

class DeleteVehicleMyHouseEvent implements MyHouseEvents {
  final VehicleEntity vehicle;
  final int index;
  final String idUnit;
  DeleteVehicleMyHouseEvent(this.idUnit, this.vehicle, this.index);
}
