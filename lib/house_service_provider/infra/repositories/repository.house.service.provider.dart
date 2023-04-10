import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';
import 'package:soares_administradora_condominios/house_service_provider/domain/irepositories/irepository.house.service.provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/adapters/json.to.from.house.service.provider.dart';
import 'package:soares_administradora_condominios/house_service_provider/infra/datasource/datasource.house.service.provider.dart';

class HouseServiceProviderRepository
    implements IHouseServiceProviderRepository {
  final IHouseServiceProviderDataSource houseServiceProviderDataSource;
  HouseServiceProviderRepository(this.houseServiceProviderDataSource);

  @override
  Future<void> registerHouseServiceProvider(
      HouseServiceProviderEntity houseServiceProvider) async {
    final mapHouseServiceProvider =
        JsonToFromHouseServiceProviderEntity.toMap(houseServiceProvider);
    await houseServiceProviderDataSource
        .registerHouseServiceProvider(mapHouseServiceProvider);
  }

  @override
  Future<void> updateValueHouseServiceProvider(
      HouseServiceProviderEntity houseServiceProviderEntity, int index) async {
    final mapHouseServiceProvider =
        JsonToFromHouseServiceProviderEntity.toMap(houseServiceProviderEntity);
    await houseServiceProviderDataSource.updateValueHouseServiceProvider(
        mapHouseServiceProvider, index);
  }
  
  @override
  Future<void> deleteHouseServiceProvider(String doc, String cpf, int index) async {
        await houseServiceProviderDataSource.deleteHouseServiceProvider(doc, cpf, index);

  }
}
