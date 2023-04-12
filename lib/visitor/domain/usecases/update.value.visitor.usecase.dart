
import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/irepositories/irepository.visitor.dart';

abstract class IUpdateValueVisitor {
  Future<void> call(VisitorEntity visitorEntity,int index);
}

class UpdateValueVisitor implements IUpdateValueVisitor {
  final IVisitorRepository repository;

  UpdateValueVisitor(this.repository);
  @override
  Future<void> call(VisitorEntity visitorEntity,int index) async {
    await repository.updateValueVisitor(visitorEntity, index);
  }
}
