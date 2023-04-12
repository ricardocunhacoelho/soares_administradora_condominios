abstract class IHouseServiceProviderDataSource {
  Future<void> registerHouseServiceProvider(
      Map<String, dynamic> houseServiceProviderMap);

  Future<void> updateValueHouseServiceProvider(
      Map<String, dynamic> mapHouseServiceProvider, int index);

  Future<void> deleteHouseServiceProvider(String doc, String cpf, int index);
}
