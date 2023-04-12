

import 'package:soares_administradora_condominios/visitor/domain/entity/visitor.entity.dart';
import 'package:soares_administradora_condominios/visitor/domain/irepositories/irepository.visitor.dart';

abstract class IRegisterVisitor{
  Future<void> call(VisitorEntity visitor);
}
class RegisterVisitor implements IRegisterVisitor {
  final IVisitorRepository repository;

  RegisterVisitor(this.repository);
  @override
  Future<void> call(VisitorEntity visitor) async {
    await repository.registerVisitor(visitor);
  }
}
