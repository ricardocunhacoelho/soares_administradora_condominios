
import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';

abstract class ILostFoundRepository {
  Stream<List<LostFoundEntity>> getAllLostFound();

}
