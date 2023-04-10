
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/irepositories/irepository.house.service.provider.dart';

abstract class IRegisterHouseServiceProvider{
  Future<void> call(HouseServiceProviderEntity houseServiceProvider);
}
class RegisterHouseServiceProvider implements IRegisterHouseServiceProvider {
  final IHouseServiceProviderRepository repository;

  RegisterHouseServiceProvider(this.repository);
  @override
  Future<void> call(HouseServiceProviderEntity houseServiceProvider) async {
    await repository.registerHouseServiceProvider(houseServiceProvider);
  }
}
