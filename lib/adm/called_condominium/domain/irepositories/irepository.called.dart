
import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';

abstract class ICalledRepository {
  Future<void> sendCalled(CalledEntity called);
}
