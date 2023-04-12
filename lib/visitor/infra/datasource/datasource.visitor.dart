
abstract class IVisitorDataSource {
  Future<void> registerVisitor(Map<String, dynamic> visitorMap);

  Future<void> updateValueVisitor(Map<String, dynamic> mapVisitor, int index);

  Future<void> deleteVisitor(String doc, String cpf, int index);
}
