import 'package:soares_administradora_condominios/adm/lost_found/domain/entity/lost.found.entity.dart';
import 'package:soares_administradora_condominios/adm/lost_found/domain/irepositories/irepository.lost.found.dart';
import 'package:soares_administradora_condominios/adm/lost_found/infra/adapters/json.to.from.lost.found.entity.dart';
import 'package:soares_administradora_condominios/adm/lost_found/infra/datasource/datasource.lost.found.dart';

class LostFoundRepository implements ILostFoundRepository {
  final ILostFoundDataSource lostFoundDataSource;
  LostFoundRepository(this.lostFoundDataSource);

  @override
  Stream<List<LostFoundEntity>> getAllLostFound() {
    final streamList = lostFoundDataSource.getAllLostFound();
    return streamList.map(_convert);
  }

  List<LostFoundEntity> _convert(List<dynamic> list) {
    var test1 = list.map(JsonToFromLostFoundEntity.fromMap).toList();
    return test1;
  }
}
