
abstract class IResidentDataSource {
  Future<void> registerResident(Map<String, dynamic> residentMap);

  Future<void> updateValueResident(Map<String, dynamic> mapResident, int index);

  Future<void> deleteResident(String cpf, int index);
}
