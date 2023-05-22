import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/area.condominium.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/entity/reserve.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/domain/irepositories/irepository.area.condominium.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/adapters/json.to.from.area.condominium.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/adapters/json.to.from.reservation.entity.dart';
import 'package:soares_administradora_condominios/adm/areas_condominium/infra/datasource/datasource.area.condominium.dart';

class AreaCondominiumRepository implements IAreaCondominiumRepository {
  final IAreaCondominiumDataSource areaCondominiumDataSource;
  AreaCondominiumRepository(this.areaCondominiumDataSource);

  @override
  Stream<List<AreaCondominiumEntity>> getAllAreaCondominium() {
    final streamList = areaCondominiumDataSource.getAllAreaCondominium();
    return streamList.map(_convert);
  }

  List<AreaCondominiumEntity> _convert(List<dynamic> list) {
    final listaCorrect =
        list.map(JsonToFromAreaCondominiumEntity.fromMap).toList();
    return listaCorrect;
  }

  @override
  Stream<AreaCondominiumEntity> fetchArea(String id) {
    final streamMap = areaCondominiumDataSource.fetchArea(id);
    return streamMap.map(_convertArea);
  }

  AreaCondominiumEntity _convertArea(Map<dynamic, dynamic> map) {
    return JsonToFromAreaCondominiumEntity.fromMap(map);
  }

  @override
  Future<void> makeReserve(ReserveEntity reserve, String uid) async {
    final mapReserve = JsonToFromReserveEntity.toMap(reserve);
    await areaCondominiumDataSource.makeReserve(mapReserve, uid);
  }
}
