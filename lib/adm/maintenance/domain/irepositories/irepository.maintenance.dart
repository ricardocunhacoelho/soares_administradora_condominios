
import 'package:soares_administradora_condominios/adm/maintenance/domain/entity/maintenance.entity.dart';

abstract class IMaintenanceRepository {
  Future<void> requestMaintenance(MaintenanceEntity maintenance);
}
