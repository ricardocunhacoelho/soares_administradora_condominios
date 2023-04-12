
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/irepositories/irepository.house.service.provider.dart';

abstract class IUpdateValueHouseServiceProvider {
  Future<void> call(HouseServiceProviderEntity houseServiceProviderEntity,int index);
}

class UpdateValueHouseServiceProvider implements IUpdateValueHouseServiceProvider {
  final IHouseServiceProviderRepository repository;

  UpdateValueHouseServiceProvider(this.repository);
  @override
  Future<void> call(HouseServiceProviderEntity houseServiceProviderEntity,int index) async {
    await repository.updateValueHouseServiceProvider(houseServiceProviderEntity, index);
  }
}
