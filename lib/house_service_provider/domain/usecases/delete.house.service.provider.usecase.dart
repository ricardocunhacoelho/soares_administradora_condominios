
import 'package:soares_administradora_condominios/house_service_provider/domain/irepositories/irepository.house.service.provider.dart';

abstract class IDeleteHouseServiceProvider {
  Future<void> call(String doc, String cpf, int index);
}

class DeleteHouseServiceProvider implements IDeleteHouseServiceProvider {
  final IHouseServiceProviderRepository repository;

  DeleteHouseServiceProvider(this.repository);
  @override
  Future<void> call(String doc, String cpf, int index) async {
    await repository.deleteHouseServiceProvider(doc, cpf, index);
  }
}
