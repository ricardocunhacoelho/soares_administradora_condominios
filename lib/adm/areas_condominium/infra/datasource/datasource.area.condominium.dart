abstract class IAreaCondominiumDataSource {
  
  Stream<List<dynamic>> getAllAreaCondominium();

  Stream<Map<dynamic, dynamic>> fetchArea(String id);

  Future<void> makeReserve(Map<String, dynamic> mapReserve, String uid);
}
