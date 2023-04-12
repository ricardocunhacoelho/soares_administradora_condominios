import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/irepositories/irepository.visitor.dart';
import 'package:soares_administradora_condominios/visitor/infra/adapters/json.to.from.visitor.dart';
import 'package:soares_administradora_condominios/visitor/infra/datasource/datasource.visitor.dart';

class VisitorRepository implements IVisitorRepository {
  final IVisitorDataSource visitorDataSource;
  VisitorRepository(this.visitorDataSource);

  @override
  Future<void> registerVisitor(VisitorEntity visitor) async {
    final mapVisitor = JsonToFromVisitorEntity.toMap(visitor);
    await visitorDataSource.registerVisitor(mapVisitor);
  }

  @override
  Future<void> updateValueVisitor(
      VisitorEntity visitorEntity, int index) async {
    final mapVisitor = JsonToFromVisitorEntity.toMap(visitorEntity);
    await visitorDataSource.updateValueVisitor(mapVisitor, index);
  }

  @override
  Future<void> deleteVisitor(String doc, String cpf, int index) async {
    await visitorDataSource.deleteVisitor(doc, cpf, index);
  }
}
