import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';

abstract class IVisitorRepository {
  Future<void> registerVisitor(VisitorEntity visitor);

  Future<void> updateValueVisitor(VisitorEntity visitorEntity, int index);

  Future<void> deleteVisitor(String doc, String cpf, int index);
}
