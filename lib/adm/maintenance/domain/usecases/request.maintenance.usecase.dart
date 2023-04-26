
import 'package:soares_administradora_condominios/adm/maintenance/domain/entity/maintenance.entity.dart';
import 'package:soares_administradora_condominios/adm/maintenance/domain/irepositories/irepository.maintenance.dart';

abstract class IRequestMaintenance {
  Future<void> call(MaintenanceEntity maintenance);
}

class RequestMaintenance implements IRequestMaintenance {
  final IMaintenanceRepository repository;

  RequestMaintenance(this.repository);
  @override
  Future<void> call(MaintenanceEntity maintenance) {
    return repository.requestMaintenance(maintenance);
  }
}