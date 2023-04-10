
import 'package:soares_administradora_condominios/house_service_provider/domain/entity/house.service.provider.entity.dart';

abstract class IHouseServiceProviderRepository {
  Future<void> registerHouseServiceProvider(HouseServiceProviderEntity houseServiceProvider);

  Future<void> updateValueHouseServiceProvider(HouseServiceProviderEntity houseServiceProviderEntity, int index);

  Future<void> deleteHouseServiceProvider(String doc, String cpf, int index);
}
