
import 'package:soares_administradora_condominios/resident/domain/entity/resident.entity.dart';
import 'package:soares_administradora_condominios/resident/domain/irepository/irepository.resident.dart';

abstract class IDeleteResident{
  Future<void> call(String cpf, int index);
}
class DeleteResident implements IDeleteResident {
  final IResidentRepository repository;

  DeleteResident(this.repository);
  @override
  Future<void> call(String cpf, int index) async {
    await repository.deleteResident(cpf,index);
  }
}
