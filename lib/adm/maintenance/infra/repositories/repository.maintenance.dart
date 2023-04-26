import 'package:soares_administradora_condominios/adm/maintenance/domain/entity/maintenance.entity.dart';
import 'package:soares_administradora_condominios/adm/maintenance/domain/irepositories/irepository.maintenance.dart';
import 'package:soares_administradora_condominios/adm/maintenance/infra/adapters/json.to.from.maintenance.entity.dart';
import 'package:soares_administradora_condominios/adm/maintenance/infra/datasource/datasource.maintenance.dart';

class MaintenanceRepository implements IMaintenanceRepository {
  final IMaintenanceDataSource maintenanceDataSource;
  MaintenanceRepository(this.maintenanceDataSource);

  @override
  Future<void> requestMaintenance(MaintenanceEntity maintenance) async {
    final mapMaintenance = JsonToFromMaintenanceEntity.toMap(maintenance);
    await maintenanceDataSource.requestMaintenance(mapMaintenance);
  }
}
