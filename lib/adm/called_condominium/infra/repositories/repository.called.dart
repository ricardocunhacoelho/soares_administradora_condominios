
import 'package:soares_administradora_condominios/adm/called_condominium/domain/entity/called.entity.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/domain/irepositories/irepository.called.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/infra/adapters/json.to.from.called.entity.dart';
import 'package:soares_administradora_condominios/adm/called_condominium/infra/datasource/datasource.called.dart';

class CalledRepository implements ICalledRepository {
  final ICalledDataSource calledDataSource;
  CalledRepository(this.calledDataSource);

  @override
  Future<void> sendCalled(CalledEntity called) async {
    final mapCalled = JsonToFromCalledEntity.toMap(called);
    await calledDataSource.sendCalled(mapCalled);
  }
}